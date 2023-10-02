#include "curl_wrapper/curl_wrapper.hpp"

#include <curl/curl.h>

namespace curl_wrapper {
    std::string http_get_string(const std::string &ulr) {
        const auto curl = curl_easy_init();
        curl_easy_setopt(curl, CURLOPT_URL, ulr.c_str());
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        const auto write_func = [](char* ptr, size_t size, size_t nmemb, void* userdata) {
            auto &result = *static_cast<std::string*>(userdata);
            result.append(ptr, size * nmemb);
            return size * nmemb;
        };
        using WriteFunction = size_t (*)(char*, size_t, size_t, void*);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, static_cast<WriteFunction>(write_func));
        std::string result;
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &result);
        curl_easy_perform(curl);
        curl_easy_cleanup(curl);
        return result;
    }

    std::string url_encode(const std::string &s) {
        CURL *curl = curl_easy_init();
        char *output = curl_easy_escape(curl, s.c_str(), s.length());
        std::string result(output);
        curl_free(output);
        curl_easy_cleanup(curl);
        return result;
    }
}