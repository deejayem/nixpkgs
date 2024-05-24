{ lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "havn";
  version = "0.1.11";

  src = fetchFromGitHub {
    owner = "mrjackwills";
    repo = "havn";
    rev = "v${version}";
    hash = "sha256-iotSSKId2y3Y7Dh8iSW1/y3xDbXHHPl6RQ3uA/+JdE8=";
  };

  cargoHash = "sha256-Tec1YeP1zwE8nurQOYxa9hzGBy3uxkjDUFlh0BppUTo=";

  # Tests fail with permission denied errors when trying to bind ports 80 and 443
  doCheck = false;

  meta = with lib; {
    description = "A fast configurable port scanner with reasonable defaults";
    homepage = "https://github.com/mrjackwills/havn";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ deejayem ];
  };
}
