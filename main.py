from playwright.sync_api import Error, sync_playwright


def remote_html():
    with sync_playwright() as p:
        browser = p.webkit.launch(headless=True)
        try:
            page = browser.new_page()
            page.goto("https://playwright.dev/python/")
            page.wait_for_load_state("networkidle")
            page.screenshot(path="remote.png", full_page=True)
        except Error as e:
            print(f"An error occurred: {e}")
        finally:
            if browser.is_connected:
                browser.close()


def local_html():
    # export DEBUG=pw:browser*
    with open("local.html", encoding="utf-8") as f:
        html = f.read()

    with sync_playwright() as p:
        browser = p.webkit.launch(headless=True)
        try:
            page = browser.new_page()
            page.set_content(html)
            wrapper = page.query_selector(".wrapper")
            if wrapper:
                wrapper.screenshot(path="local.png", type="png")
        except Error as e:
            print(f"An error occurred: {e}")
        finally:
            if browser.is_connected:
                browser.close()


def main():
    remote_html()
    local_html()


if __name__ == "__main__":
    main()
