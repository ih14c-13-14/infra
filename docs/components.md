# 構成するインフラコンポーネント類


1. **Azure Kubernetes Service (AKS)**: バックエンドのNestJSアプリケーションをデプロイおよびスケーリングするためのKubernetesクラスタ。

2. **Azure Database for PostgreSQL**: バックエンドが使用するリレーショナルデータベース。

3. **Azure Cache for Redis**: バックエンドが使用するインメモリデータストア。

4. **Azure Storage**: フロントエンドのReactアプリケーションの静的ファイルをホストするためのストレージサービス。

5. **Azure CDN**: フロントエンドの静的コンテンツをキャッシュおよび配信するためのコンテンツ配信ネットワーク。

6. **Application Gateway**: バックエンドとフロントエンド間のリクエストルーティングを管理するリバースプロキシ。

7. **Azure Monitor/Azure Log Analytics**: アプリケーションおよびインフラストラクチャの監視、パフォーマンスメトリクスの収集、ログの分析。

8. **Grafana**: Azure MonitorやAzure Log Analyticsから収集したメトリクスを可視化するためのダッシュボードツール。

9. **Azure Resource Manager (ARM)テンプレート or Terraform**: Infrastructure as Code (IaC)を実装するためのツール。
