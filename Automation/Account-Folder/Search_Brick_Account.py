from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import time


@keyword
def handle_brick_action(brick_exists, brick_name_id):
    # Get the instance of SeleniumLibrary
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')

    # Check if brick exists
    if brick_exists:
        try:
            # Click the brick element using the correct XPath
            selenium_lib.click_element(f"xpath={brick_name_id}")
        except Exception as e:
            print(f"Error occurred while clicking: {e}")
    else:
        # Create Brick logic
        # Replace with your actual logic to create a brick
        BuiltIn().run_keyword('Create Brick')

