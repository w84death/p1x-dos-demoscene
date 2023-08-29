import os
import argparse
from PIL import Image

def png_to_bit_array(png_path):
    # Load the image and convert it to monochrome
    img = Image.open(png_path).convert('1')
    width, height = img.size

    # Initialize an empty list for the bit rows
    bit_rows = []

    for y in range(height):
        row_val = 0
        for x in range(width):
            pixel = img.getpixel((x, y))
            # If the pixel is black (not 0), set the corresponding bit
            if pixel != 0:
                row_val |= (1 << (7 - x))
        bit_rows.append(row_val)

    return bit_rows

def generate_font_header(folder_path, char_string):
    font_data = []

    for idx, char in enumerate(char_string):
        png_path = os.path.join(folder_path, f"{idx}.png")
        if os.path.exists(png_path):
            font_data.append(png_to_bit_array(png_path))
        else:
            # If the PNG doesn't exist, add an empty bit array
            font_data.append([0] * 8)

    # Generate the C++ header content
    header_content = "unsigned char fontData[58][8] = {\n"
    for idx, char in enumerate(char_string):
        row_data = ", ".join([f"0x{byte:02X}" for byte in font_data[idx]])
        header_content += f"  {{{row_data}}}, /* {char} {idx}*/\n"
    header_content += "};\n"

    # Write the header content to a file
    with open("FONT.H", "w") as f:
        f.write(header_content)

def main():
    parser = argparse.ArgumentParser(description="Generate C++ font header from PNG images.")
    parser.add_argument("folder_path", help="Path to the folder containing the PNG images.")

    args = parser.parse_args()

    char_string = r'!"#$%&"()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    generate_font_header(args.folder_path, char_string)
    print("FONT.H - C++ font header from PNG images created.")
if __name__ == "__main__":
    main()
