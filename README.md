# Doker Imageのビルド
それぞれのnode1, node2, mastaerにてそれぞれ実行。Docker registryで管理してればそこへ

```
docker build -t python-local-k8s .
```

# Docker Imageの確認

```
docker images
REPOSITORY                                       TAG       IMAGE ID       CREATED        SIZE
python-local-k8s                                 latest    aeb64b673028   3 hours ago    389MB
```

# DeploymentとServiceの作成
kubanetesにてマニフェストファイルの読み込みを行い。DeploymentとServiceを作成する。

```
cd k8s
kubectl apply -f k8s-resource.yml
```

# DeploymentとServiceの確認

```
kubectl get deployment
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
python-fastapi   1/1     1            1           3h4m

kubectl get pods
NAME                              READY   STATUS    RESTARTS   AGE
python-fastapi-59fb4749cf-pjsct   1/1     Running   0          3h1m

kubectl get service
NAME             TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
kubernetes       ClusterIP      10.96.0.1       <none>         443/TCP          4d5h
python-fastapi   LoadBalancer   10.99.237.251   172.21.0.180   8700:31341/TCP   3h3m
```

# リソースの削除

```
kubectl delete deployment {NAME}
kubectl delete service {NAME}
```