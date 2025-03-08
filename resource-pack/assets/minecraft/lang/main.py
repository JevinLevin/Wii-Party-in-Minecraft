from PIL import Image, ImageDraw, ImageFont
import json
import os
import re

def apply_threshold_and_outline(image, threshold=128):
    image = image.convert("RGBA")
    width, height = image.size
    pix = image.load()

    for y in range(height):
        for x in range(width):
            pix[x, y] = (0, 0, 0, 0) if pix[x, y][3] < threshold else (255, 255, 255, 255)

    outline = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    shifts = [(-1, 0), (1, 0), (0, -1), (0, 1), (0, 2), (-1, -1), (1, -1), (-1, 1), (1, 1),(-1, 2), (1, 2)]
    for dx, dy in shifts:
        shifted = image.copy().crop((0, 0, width, height))
        outline.paste((0, 0, 0, 255), (dx, dy), shifted)

    return Image.alpha_composite(outline, image)

def wrap_text(text, font, box_width, draw):
    words = text.split()
    lines = []
    current_line = ""
    for word in words:
        test_line = f"{current_line} {word}".strip()
        bbox = draw.textbbox((0, 0), test_line, font=font)
        line_width = bbox[2] - bbox[0]
        if line_width <= box_width:
            current_line = test_line
        else:
            lines.append(current_line)
            current_line = word
    if current_line:
        lines.append(current_line)
    return lines

def get_largest_font_size_that_fits(draw, text, box_width, box_height, font_path, max_font_size=20, min_font_size=1):
    if text == "":
        return min_font_size
    for size in range(max_font_size, min_font_size - 1, -1):
        font = ImageFont.truetype(font_path, size)
        lines = wrap_text(text, font, box_width, draw)
        ascent, descent = font.getmetrics()
        line_height = ascent + descent
        total_text_height = line_height * len(lines)
        max_line_width = max(
            (draw.textbbox((0, 0), line, font=font)[2] - draw.textbbox((0, 0), line, font=font)[0]) 
            for line in lines
        )
        if max_line_width <= box_width and total_text_height <= box_height:
            return size
    return min_font_size

def draw_text_in_box(draw, text, box, font_path):
    left, top, right, bottom = box
    box_width = right - left
    box_height = bottom - top

    font_size = get_largest_font_size_that_fits(draw, text, box_width, box_height, font_path)
    font = ImageFont.truetype(font_path, font_size)
    lines = wrap_text(text, font, box_width, draw)
    ascent, descent = font.getmetrics()
    line_height = ascent + descent
    current_y = top + (box_height - line_height * len(lines)) // 2

    for line in lines:
        bbox = draw.textbbox((0, 0), line, font=font)
        line_width = bbox[2] - bbox[0]
        x = left + (box_width - line_width) // 2
        draw.text((x, current_y), line, font=font, fill=(255, 255, 255, 255))
        current_y += line_height

def main(lang="en_us"):
    with open(f"{lang}.json", "r") as f:
        strings = json.load(f)

    strings["Jersey 10,txt size 4pt"] = "Jersey 10,txt size 4pt"
    strings[""] = ""

    rows = [
        ["Jersey 10,txt size 4pt", "game.DiceyDescentName", "game.ZombieTagName", "game.BarrelDaredevilName", "game.BackAttackName", "game.LuckyLaunchName"],
        ["game.ChopChopsName", "game.PopgunPosseName", "game.FlagFracasName", "game.TropicalPunchName", "game.FriendlyFaceOffName", "game.GoalGettersName"],
        ["game.RiskyRailwayName", "game.MazeDazeName", "game.HammerHeadsName", "game.StopWatchersName", "game.StrategyStepsName", "game.FaceFlipName"],
        ["game.ShutterpupName", "game.WalkOffName", "game.DerbyDashName", "game.FeatheredFrenzyName", "game.PearlPlunderName", "game.ChinUpChampName"],
        ["game.RamJamName", "game.SmileSnapName", "", "", "", ""]
    ]

    img_width, img_height = 840, 100
    image = Image.new("RGBA", (img_width, img_height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    
    font_path = "Jersey10-Regular.ttf"
    row_height = 20
    horizontal_spacing = 5

    current_top = 0
    for row in rows:
        count = len(row)
        total_spacing = horizontal_spacing * (count - 1)
        col_width = (img_width - total_spacing) / count
        current_left = 0
        
        for key in row:
            box = (
                int(current_left),
                int(current_top),
                int(current_left + col_width),
                int(current_top + row_height)
            )
            draw_text_in_box(draw, strings[key], box, font_path)
            current_left += col_width + horizontal_spacing
        current_top += row_height

    image = apply_threshold_and_outline(image, threshold=45)
    filename = f"_namesheet_{lang}.png"
    image.save(filename)
    print(f"Saved {filename}")

def find_json_languages():
    lang_files = [f for f in os.listdir() if re.match(r"([a-z]{2}_[a-z]{2})\.json$", f)]
    return [os.path.splitext(f)[0] for f in lang_files]

def process_all_languages():
    languages = find_json_languages()
    for lang in languages:
        print(f"Processing language: {lang}")
        try:
            main(lang)
        except:
            print(f"Language failed to process: {lang}")

if __name__ == "__main__":
    process_all_languages()
