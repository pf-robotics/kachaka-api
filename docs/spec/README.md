# カチャカAPI仕様書

このディレクトリには、[カチャカAPI仕様書](https://pf-robotics.github.io/kachaka-api/) として GitHub Pages で公開するファイルを置いています。

* `index.html`: API仕様書
* `kachaka-api.proto`: 仕様書の生成に使った proto ファイル

これらのファイルは生成物のため、直接編集しないでください。`protos/kachaka-api.proto` を更新するときに、あわせて再生成します。
CI では、`kachaka-api.proto` が `protos/kachaka-api.proto` と一致しているかを確認しています。
