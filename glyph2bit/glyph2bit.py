from PIL import Image
import sys

def image_to_bytes(filename):
    # Load the image (BMP or PNG) and convert to grayscale
    image = Image.open(filename).convert('L')

    # Binarize the image
    threshold = 128  # This can be adjusted
    binary_image = image.point(lambda p: p > threshold and 255)

    # Convert each row to a byte value
    byte_values = []
    for y in range(binary_image.height):
        byte_value = 0
        for x in range(binary_image.width):
            if binary_image.getpixel((x, y)) == 0:  # If pixel is "on"
                byte_value |= (1 << (7 - x))
        byte_values.append(byte_value)
    
    return byte_values

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python image_to_bytes.py <path_to_image_file>")
        sys.exit(1)

    filename = sys.argv[1]
    bytes_data = image_to_bytes(filename)
    print("\n")
    for byte in bytes_data:
        print(f"0x{byte:02X}, ", end='')
    print("\n")

