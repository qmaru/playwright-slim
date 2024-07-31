from playwright.sync_api import sync_playwright, Error


def html_to_png(url: str, output_file: str):
    with sync_playwright() as p:
        browser = p.webkit.launch(headless=True)  # 启动无头模式

        try:
            page = browser.new_page()
            page.goto(url)
            page.screenshot(path=output_file, full_page=True)
        except Error as e:
            print(f"An error occurred: {e}")
        finally:
            if browser.is_connected:
                browser.close()


url = "https://www.google.com"
output_file = "/output/google.png"
html_to_png(url, output_file)
