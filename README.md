# loot-nft-sample

loot から作る nft の sample コントラクト

## 構成

- hardhat
- ether.js
- openzeppelin

## 環境構築

dotenv のファイルを作成する

.env

```shell
API_URL = {alchemyapiのURL}
PRIVATE_KEY = {アカウントの秘密鍵}
ETHERSCAN_API_KEY = {etherscanのAPIkey}

```

## テスト

```shell
npx hardhat test
```

## デプロイ

### rinkeby

```
npx hardhat run scripts/deploy.js --network rinkeby
```

### local

```
npx hardhat run scripts/deploy.js --network hardhat
```

## verify

```
npx hardhat verify --network rinkeby {コントラクトのアドレス} {baseTokenURL}
```
