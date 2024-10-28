// https://chatgpt.com/share/671cfe56-e934-800c-a558-87b81006d347

// ◇ 事象
// 画面は遷移するのですが以下のエラーが出力されます。
// 原因と解決方法を教えてください。
// ======== Exception caught by scheduler library ========
// The following assertion was thrown during a scheduler callback:
// There are multiple heroes that share the same tag within a subtree.
// ◇ エラー原因
// このエラーは、FlutterのHeroアニメーションに関連するものです。
// FloatingActionButton が同じ「タグ」を持つため、画面遷移時にHeroアニメーションで競合が発生しています。
// デフォルトで FloatingActionButton にはHeroタグが割り当てられているため、
// 同じボタンを複数の画面で使用する際に、Heroタグの競合が生じることがあります。
// ◇ エラー解決方法
// 1. Heroアニメーションを無効化: FloatingActionButton に heroTag プロパティを設定し、画面ごとに異なる値を割り当てることで解決できます。
// 2. または、Heroアニメーションが不要であれば heroTag: null を設定して無効化することもできます。
