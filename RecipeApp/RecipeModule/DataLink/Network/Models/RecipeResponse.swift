//
//  RecipeNetworkResponse.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

struct RecipeNetworkResponse: Codable


{
    "from": 1,
    "to": 20,
    "count": 10000,
    "_links": {
        "next": {
            "href": "https://api.edamam.com/api/recipes/v2?q=c&app_key=a03fbeae4bf6fc4fd46a3f4d156cdd94&field=image&field=label&field=source&_cont=CHcVQBtNNQphDmgVQntAEX4BYkt6BQABRG1IB2oWalVxAQQFUXlSUmIRZVV3BAoEQzEVB2dBZ116DVFUFW0SATMWYl17UQMVLnlSVSBMPkd5BgNK&from=20&type=public&app_id=464be998",
            "title": "Next page"
        }
    },
    "hits": [
        {
            "recipe": {
                "label": "Vitamin C Drink",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/54a/54abb5ddccc6b7046a6d2478e048dede?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCqbvgqGDJnGwUNg8Nl6q5zH%2BbGwWQAHAwak9l6xuAkgAIgOyNPw8k5aXynYy4iSd1AxqCRAjK9fd%2F0fY9P7BUwPyMqwgUIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDFxFrGCwOt0CtLz18iqWBbGSFh9eSuhZLBc5%2FBuHriHEQUfjqvcwK7OqTWOkUCheqSkU6e4DAIMB8fKqZluvJd9Gl3CU1zy3QEfWpk3v8VScRXR%2BmRj4f4wu1NZSltZrxx3%2FWHZgd9ha%2BIxBqYKNXNo%2FDNaDjS26OhF%2FOAccBdVfDZ%2BT4MiPA4v%2BtDbrO9s%2FzagE3Xn959srC9AFZVY9LHe2NskG45y9gS%2F9C80X70Wcv3MQzuozgfAVMsSe8dJQ1Y1yIdVWn17GradqNykaLZlmOFc1%2ByKSx4c8o%2FOOq8rH65iiPCxZstXJk3KSMMuf903VTQOS601zM3xvWjU6I2Mh5XUJFVX82AYp%2F4dfynQr7N8lNbQtII4qERcD47Q4TWqWCRxBqyX250nPPJ3U7tMcLCqT8QxZf3IcbcrzF%2BJ46%2F2kAsLuMIV8TE9bLRPDvL8lpJnjxoqcaiWJSUb60F%2FiPevclw0L5c%2F9GJnpP0q8Yz2htKQOfvJaKKwF3wgo13Q5qRacvW0sPOUHEhXCz3SjpkvEBsl2gQBMiMpcAIp08P0Q4NOMAGezD3%2FVHjjCKkogN6MPaHO1A%2Fqm0Xc70nwuzCKg3ToC%2FuxRkCR%2FsKIalU9xEXB8gYc9GnFcyUPyvsgsG1RKWgBxem77AFoyZ%2BEJCq2oBrnVNYwMmuuV71f%2F6SFu2JzgQ4H0sxS1XIIEs24FxfPQQG%2FIQdRltRGO9KLAphexCOtuNVbxM%2F%2BLHcax%2FFXsXojZ0y0%2BQDSH8D%2FosBwsLP6MwvyzOlLRjra5sisiILQH1xYV56fpS3%2FZbR9rHwGULbITD%2BUhKHgyGXrqtmNflbZS72UeP2ix%2BJMUUdI68YSfAeRPoNug%2FCj0%2BgUXC8QgXUQOn2i1KjXUOUakHCVmGbo%2BMNWU7bUGOrEB0KA%2BDv51Iwwyd5l4utcr4M%2FQFrHAxDizkDPfVeZVx3I6txQv5g5nVWy2%2B8UJvTl7zhH%2B%2FD%2F1%2BLgyNcut6iGAfE6MHLkbXM2FnP5GiuKBjyv6xNiG5RYfEy%2FW2lsri6LJ265E9zeDCIZOzIx2eEXZJbe8j2QfHO8KmelyJHbJHxU9XvE9%2FIKkn2wxBkPnviV6TuMzoLXn%2FnjjqGIziEosrLLOF45JYmbqVjFMYdz%2F0YNH&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240813T123627Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFC5QT5XPZ%2F20240813%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7a7c47909fa2871cfe21a402fd56e076cfd3cb688f9bc2f9be1a69525626074e",
                "source": "Martha Stewart"
            }
        }
    ]
}
