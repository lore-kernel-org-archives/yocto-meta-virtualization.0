Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.719.1588188535004132334
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 12:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kb3yWzEj;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r7so2499010edo.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2020 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=30ErTJQS51KUL63gQz4I1nOT+53unIB16RtlOMsPqJM=;
        b=kb3yWzEjDnF+WlMBC6zt/JvMdoD8eh6yNcx2OacqWTM6EjyhDAHUsKO+UO3kFxxYHH
         hdZi1SsVjzxzZMkEEH3xd1yCHxJS5cQO+odIozcWVbexIGV79V8FJm2mLqLARHmi5jJu
         adOEUNIOpDhs77CjshJh3lTG7dohS+U6y3Ol36vtJbn7v5nYQvB7xOSzruj9OA16mWwu
         LB9StWyTQbFKtlA/zBmVCh5iV+zzPa91JRe4k16jnnXe4H01MdLOniwpqd2BjLnb44um
         JOaXsX5K3eLNvObc+K5qOQarAhh6NCQV9IBzjvUz/yQKQTFe+58x/jxWKuXEbiVD2EjB
         wIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=30ErTJQS51KUL63gQz4I1nOT+53unIB16RtlOMsPqJM=;
        b=XDw0ScnLZByJH2b/CoB7H6Wt46WSHXV+/cGxiUAcz9nylVnvdSCdcneOoDuZ1GFiU7
         YcE0mEQ+dFywt77vBgFioZr404Ug/suzScMWBJ+7OxGOyyn+QPOfaqmAPrvd9hCMqw6q
         AWvPKEpfohtMaSTushYVO/m5oxdnLd/ZjpZYb4Ivo2J29E/NisFdieOTP+EaEZgpzcNq
         GgLl+FildM3TG/ApwzWfdW3GxdK8zYM3e0pcPzesoBRTReU0TQiCgRzXGwehoghRWDJs
         w7fHJ4la5CJ9FTLAp32w5Vu4gBiNRLVofc510xvaZtwOhsmvYHmshcyyCLXq9dLzzncc
         ypMA==
X-Gm-Message-State: AGi0PuYyBsWZHQH516O8Cn7vXyUi+3zNng7g7LGYaqeAprCmf8YJCsIL
	uLypqQ5YWMtCCyd2KpRQnqFovNOfWGL73dBycICLtiLI
X-Google-Smtp-Source: APiQypICG4tgLMKZQjFNRS+7wdGwIVMdaDiRUyumo8ToKa/bjOWFUQQKEsIo01to4kDMHhAR/SStueboZNca5lqGORY=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr3896469edt.164.1588188531720;
 Wed, 29 Apr 2020 12:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200429174927.154541-1-sakib.sajal@windriver.com>
In-Reply-To: <20200429174927.154541-1-sakib.sajal@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 29 Apr 2020 15:28:38 -0400
Message-ID: <CADkTA4ObCkP62dLaEj_w1hrWFsB6ANrSPv2uSpd-NGx7g2sY1g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: Backport CVE fixes
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm nearly complete on an kubernetes refresh, so I won't merge this
patch to master, and I'm inclined to do the uprev even in dunfell.

If this patch is destined for dunfell, that should indicated clearly
in the patch subject.

Cheers,

Bruce

On Wed, Apr 29, 2020 at 1:49 PM <sakib.sajal@windriver.com> wrote:
>
> CVE: CVE-2020-8551
>         - 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1
>         - 9802bfcec0580169cffce2a3d468689a407fa7dc
>         - c394d821fdafd719619eb63fcd1065a95ec02ef9
>
> CVE: CVE-2020-8552
>         - cc3190968b1f14ddf4067abef849fc41bd6068dc
>
> CVE: CVE-2019-11254
>         - a290fe55cb2f4593eb4ec5bf410cd77b9d925464
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...-to-fix-kubelet-metrics-memory-issue.patch | 313 +++++++
>  ...dd-new-endpoint-for-resource-metrics.patch | 440 ++++++++++
>  .../0001-Deal-with-auto-generated-files.patch |  60 ++
>  ...bel-from-apiserver-request-count-met.patch | 171 ++++
>  ...01-update-gopkg.in-yaml.v2-to-v2.2.8.patch | 825 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   5 +
>  6 files changed, 1814 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-co=
de-to-fix-kubelet-metrics-memory-issue.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-ne=
w-endpoint-for-resource-metrics.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Deal-w=
ith-auto-generated-files.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-remove=
-client-label-from-apiserver-request-count-met.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-update=
-gopkg.in-yaml.v2-to-v2.2.8.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-f=
ix-kubelet-metrics-memory-issue.patch b/recipes-containers/kubernetes/kuber=
netes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
> new file mode 100644
> index 0000000..5369f04
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kube=
let-metrics-memory-issue.patch
> @@ -0,0 +1,313 @@
> +From 0bf092ccc5fccb06b13afe5da86286a856d96770 Mon Sep 17 00:00:00 2001
> +From: Walter Fender <wfender@google.com>
> +Date: Thu, 6 Feb 2020 19:10:18 -0800
> +Subject: [PATCH] Add code to fix kubelet/metrics memory issue.
> +
> +Bucketing url paths based on concept/handling.
> +Bucketing code placed by handling code to encourage usage.
> +Added unit tests.
> +Fix format.
> +
> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/87913/commits/9802bfcec0580169cffce2a3d468689a407fa7dc]
> +CVE: CVE-2020-8551
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + pkg/kubelet/server/server.go      | 57 ++++++++++++++++++++++++++++---
> + pkg/kubelet/server/server_test.go | 54 ++++++++++++++++++++++++++++-
> + 2 files changed, 106 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/k=
ubelet/server/server.go
> +index 0f953c92502..05c1dc9c701 100644
> +--- a/src/import/pkg/kubelet/server/server.go
> ++++ b/src/import/pkg/kubelet/server/server.go
> +@@ -89,6 +89,7 @@ type Server struct {
> +       auth                       AuthInterface
> +       host                       HostInterface
> +       restfulCont                containerInterface
> ++      metricsBuckets             map[string]bool
> +       resourceAnalyzer           stats.ResourceAnalyzer
> +       redirectContainerStreaming bool
> + }
> +@@ -225,6 +226,7 @@ func NewServer(
> +               resourceAnalyzer:           resourceAnalyzer,
> +               auth:                       auth,
> +               restfulCont:                &filteringContainer{Containe=
r: restful.NewContainer()},
> ++              metricsBuckets:             make(map[string]bool),
> +               redirectContainerStreaming: redirectContainerStreaming,
> +       }
> +       if auth !=3D nil {
> +@@ -280,14 +282,32 @@ func (s *Server) InstallAuthFilter() {
> +       })
> + }
> +
> ++// addMetricsBucketMatcher adds a regexp matcher and the relevant buck=
et to use when
> ++// it matches. Please be aware this is not thread safe and should not =
be used dynamically
> ++func (s *Server) addMetricsBucketMatcher(bucket string) {
> ++      s.metricsBuckets[bucket] =3D true
> ++}
> ++
> ++// getMetricBucket find the appropriate metrics reporting bucket for t=
he given path
> ++func (s *Server) getMetricBucket(path string) string {
> ++      root :=3D getURLRootPath(path)
> ++      if s.metricsBuckets[root] =3D=3D true {
> ++              return root
> ++      }
> ++      return "Invalid path"
> ++}
> ++
> + // InstallDefaultHandlers registers the default set of supported HTTP =
request
> + // patterns with the restful Container.
> + func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bo=
ol) {
> ++      s.addMetricsBucketMatcher("healthz")
> +       healthz.InstallHandler(s.restfulCont,
> +               healthz.PingHealthz,
> +               healthz.LogHealthz,
> +               healthz.NamedCheck("syncloop", s.syncLoopHealthCheck),
> +       )
> ++
> ++      s.addMetricsBucketMatcher("pods")
> +       ws :=3D new(restful.WebService)
> +       ws.
> +               Path("/pods").
> +@@ -297,7 +317,14 @@ func (s *Server) InstallDefaultHandlers(enableCAdv=
isorJSONEndpoints bool) {
> +               Operation("getPods"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("stats")
> +       s.restfulCont.Add(stats.CreateHandlers(statsPath, s.host, s.reso=
urceAnalyzer, enableCAdvisorJSONEndpoints))
> ++
> ++      s.addMetricsBucketMatcher("metrics")
> ++      s.addMetricsBucketMatcher("metrics/cadvisor")
> ++      s.addMetricsBucketMatcher("metrics/probes")
> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> ++      s.addMetricsBucketMatcher("metrics/resource")
> +       //lint:ignore SA1019 https://github.com/kubernetes/enhancements/=
issues/1206
> +       s.restfulCont.Handle(metricsPath, legacyregistry.Handler())
> +
> +@@ -320,12 +347,15 @@ func (s *Server) InstallDefaultHandlers(enableCAd=
visorJSONEndpoints bool) {
> +               compbasemetrics.HandlerFor(r, compbasemetrics.HandlerOpt=
s{ErrorHandling: compbasemetrics.ContinueOnError}),
> +       )
> +
> ++      // deprecated endpoint which will be removed in release 1.20.0+.
> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> +       v1alpha1ResourceRegistry :=3D compbasemetrics.NewKubeRegistry()
> +       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusR=
esourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
> +       s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Ver=
sion),
> +               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, com=
pbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
> +       )
> +
> ++      s.addMetricsBucketMatcher("metrics/resource")
> +       resourceRegistry :=3D compbasemetrics.NewKubeRegistry()
> +       resourceRegistry.CustomMustRegister(collectors.NewResourceMetric=
sCollector(s.resourceAnalyzer))
> +       s.restfulCont.Handle(resourceMetricsPath,
> +@@ -334,6 +364,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvi=
sorJSONEndpoints bool) {
> +
> +       // prober metrics are exposed under a different endpoint
> +
> ++      s.addMetricsBucketMatcher("metrics/probes")
> +       p :=3D compbasemetrics.NewKubeRegistry()
> +       compbasemetrics.RegisterProcessStartTime(p.RawRegister)
> +       p.MustRegister(prober.ProberResults)
> +@@ -341,6 +372,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvi=
sorJSONEndpoints bool) {
> +               compbasemetrics.HandlerFor(p, compbasemetrics.HandlerOpt=
s{ErrorHandling: compbasemetrics.ContinueOnError}),
> +       )
> +
> ++      s.addMetricsBucketMatcher("spec")
> +       if enableCAdvisorJSONEndpoints {
> +               ws :=3D new(restful.WebService)
> +               ws.
> +@@ -360,6 +392,7 @@ const pprofBasePath =3D "/debug/pprof/"
> + func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +       klog.Infof("Adding debug handlers to kubelet server.")
> +
> ++      s.addMetricsBucketMatcher("run")
> +       ws :=3D new(restful.WebService)
> +       ws.
> +               Path("/run")
> +@@ -371,6 +404,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Operation("getRun"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("exec")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path("/exec")
> +@@ -388,6 +422,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Operation("getExec"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("attach")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path("/attach")
> +@@ -405,6 +440,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Operation("getAttach"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("portForward")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path("/portForward")
> +@@ -422,6 +458,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Operation("getPortForward"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("logs")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path(logsPath)
> +@@ -434,6 +471,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Param(ws.PathParameter("logpath", "path to the log").Dat=
aType("string")))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("containerLogs")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path("/containerLogs")
> +@@ -442,8 +480,10 @@ func (s *Server) InstallDebuggingHandlers(criHandl=
er http.Handler) {
> +               Operation("getContainerLogs"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("configz")
> +       configz.InstallHandler(s.restfulCont)
> +
> ++      s.addMetricsBucketMatcher("debug")
> +       handlePprofEndpoint :=3D func(req *restful.Request, resp *restfu=
l.Response) {
> +               name :=3D strings.TrimPrefix(req.Request.URL.Path, pprof=
BasePath)
> +               switch name {
> +@@ -459,7 +499,6 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +                       pprof.Index(resp, req.Request)
> +               }
> +       }
> +-
> +       // Setup pprof handlers.
> +       ws =3D new(restful.WebService).Path(pprofBasePath)
> +       ws.Route(ws.GET("/{subpath:*}").To(func(req *restful.Request, re=
sp *restful.Response) {
> +@@ -472,6 +511,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +       s.restfulCont.Handle("/debug/flags/v", routes.StringFlagPutHandl=
er(logs.GlogSetter))
> +
> +       // The /runningpods endpoint is used for testing only.
> ++      s.addMetricsBucketMatcher("runningpods")
> +       ws =3D new(restful.WebService)
> +       ws.
> +               Path("/runningpods/").
> +@@ -481,6 +521,7 @@ func (s *Server) InstallDebuggingHandlers(criHandle=
r http.Handler) {
> +               Operation("getRunningPods"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("cri")
> +       if criHandler !=3D nil {
> +               s.restfulCont.Handle("/cri/", criHandler)
> +       }
> +@@ -492,6 +533,14 @@ func (s *Server) InstallDebuggingDisabledHandlers(=
) {
> +               http.Error(w, "Debug endpoints are disabled.", http.Stat=
usMethodNotAllowed)
> +       })
> +
> ++      s.addMetricsBucketMatcher("run")
> ++      s.addMetricsBucketMatcher("exec")
> ++      s.addMetricsBucketMatcher("attach")
> ++      s.addMetricsBucketMatcher("portForward")
> ++      s.addMetricsBucketMatcher("containerLogs")
> ++      s.addMetricsBucketMatcher("runningpods")
> ++      s.addMetricsBucketMatcher("pprof")
> ++      s.addMetricsBucketMatcher("logs")
> +       paths :=3D []string{
> +               "/run/", "/exec/", "/attach/", "/portForward/", "/contai=
nerLogs/",
> +               "/runningpods/", pprofBasePath, logsPath}
> +@@ -808,10 +857,10 @@ func (s *Server) getPortForward(request *restful.=
Request, response *restful.Resp
> +       proxyStream(response.ResponseWriter, request.Request, url)
> + }
> +
> +-// trimURLPath trims a URL path.
> ++// getURLRootPath trims a URL path.
> + // For paths in the format of "/metrics/xxx", "metrics/xxx" is returne=
d;
> + // For all other paths, the first part of the path is returned.
> +-func trimURLPath(path string) string {
> ++func getURLRootPath(path string) string {
> +       parts :=3D strings.SplitN(strings.TrimPrefix(path, "/"), "/", 3)
> +       if len(parts) =3D=3D 0 {
> +               return path
> +@@ -859,7 +908,7 @@ func (s *Server) ServeHTTP(w http.ResponseWriter, r=
eq *http.Request) {
> +               serverType =3D "readwrite"
> +       }
> +
> +-      method, path :=3D req.Method, trimURLPath(req.URL.Path)
> ++      method, path :=3D req.Method, s.getMetricBucket(req.URL.Path)
> +
> +       longRunning :=3D strconv.FormatBool(isLongRunningRequest(path))
> +
> +diff --git a/src/import/pkg/kubelet/server/server_test.go b/src/import/=
pkg/kubelet/server/server_test.go
> +index eba788b50ea..5e6a1cc0588 100644
> +--- a/src/import/pkg/kubelet/server/server_test.go
> ++++ b/src/import/pkg/kubelet/server/server_test.go
> +@@ -1460,6 +1460,58 @@ func TestCRIHandler(t *testing.T) {
> +       assert.Equal(t, query, fw.criHandler.RequestReceived.URL.RawQuer=
y)
> + }
> +
> ++func TestMetricBuckets(t *testing.T) {
> ++      tests :=3D map[string]struct {
> ++              url    string
> ++              bucket string
> ++      }{
> ++              "healthz endpoint":                {url: "/healthz", buc=
ket: "healthz"},
> ++              "attach":                          {url: "/attach/podNam=
espace/podID/containerName", bucket: "attach"},
> ++              "attach with uid":                 {url: "/attach/podNam=
espace/podID/uid/containerName", bucket: "attach"},
> ++              "configz":                         {url: "/configz", buc=
ket: "configz"},
> ++              "containerLogs":                   {url: "/containerLogs=
/podNamespace/podID/containerName", bucket: "containerLogs"},
> ++              "cri":                             {url: "/cri/", bucket=
: "cri"},
> ++              "cri with sub":                    {url: "/cri/foo", buc=
ket: "cri"},
> ++              "debug v flags":                   {url: "/debug/flags/v=
", bucket: "debug"},
> ++              "pprof with sub":                  {url: "/debug/pprof/s=
ubpath", bucket: "debug"},
> ++              "exec":                            {url: "/exec/podNames=
pace/podID/containerName", bucket: "exec"},
> ++              "exec with uid":                   {url: "/exec/podNames=
pace/podID/uid/containerName", bucket: "exec"},
> ++              "healthz":                         {url: "/healthz/", bu=
cket: "healthz"},
> ++              "healthz log sub":                 {url: "/healthz/log",=
 bucket: "healthz"},
> ++              "healthz ping":                    {url: "/healthz/ping"=
, bucket: "healthz"},
> ++              "healthz sync loop":               {url: "/healthz/syncl=
oop", bucket: "healthz"},
> ++              "logs":                            {url: "/logs/", bucke=
t: "logs"},
> ++              "logs with path":                  {url: "/logs/logpath"=
, bucket: "logs"},
> ++              "metrics":                         {url: "/metrics", buc=
ket: "metrics"},
> ++              "metrics cadvisor sub":            {url: "/metrics/cadvi=
sor", bucket: "metrics/cadvisor"},
> ++              "metrics probes sub":              {url: "/metrics/probe=
s", bucket: "metrics/probes"},
> ++              "metrics resource v1alpha1":       {url: "/metrics/resou=
rce/v1alpha1", bucket: "metrics/resource"},
> ++              "metrics resource sub":            {url: "/metrics/resou=
rce", bucket: "metrics/resource"},
> ++              "pods":                            {url: "/pods/", bucke=
t: "pods"},
> ++              "portForward":                     {url: "/portForward/p=
odNamespace/podID", bucket: "portForward"},
> ++              "portForward with uid":            {url: "/portForward/p=
odNamespace/podID/uid", bucket: "portForward"},
> ++              "run":                             {url: "/run/podNamesp=
ace/podID/containerName", bucket: "run"},
> ++              "run with uid":                    {url: "/run/podNamesp=
ace/podID/uid/containerName", bucket: "run"},
> ++              "runningpods":                     {url: "/runningpods/"=
, bucket: "runningpods"},
> ++              "spec":                            {url: "/spec/", bucke=
t: "spec"},
> ++              "stats":                           {url: "/stats/", buck=
et: "stats"},
> ++              "stats container sub":             {url: "/stats/contain=
er", bucket: "stats"},
> ++              "stats summary sub":               {url: "/stats/summary=
", bucket: "stats"},
> ++              "stats containerName with uid":    {url: "/stats/namespa=
ce/podName/uid/containerName", bucket: "stats"},
> ++              "stats containerName":             {url: "/stats/podName=
/containerName", bucket: "stats"},
> ++              "invalid path":                    {url: "/junk", bucket=
: "Invalid path"},
> ++              "invalid path starting with good": {url: "/healthzjunk",=
 bucket: "Invalid path"},
> ++      }
> ++      fw :=3D newServerTest()
> ++      defer fw.testHTTPServer.Close()
> ++
> ++      for _, test :=3D range tests {
> ++              path :=3D test.url
> ++              bucket :=3D test.bucket
> ++              require.Equal(t, fw.serverUnderTest.getMetricBucket(path=
), bucket)
> ++      }
> ++}
> ++
> + func TestDebuggingDisabledHandlers(t *testing.T) {
> +       fw :=3D newServerTestWithDebug(false, false, nil)
> +       defer fw.testHTTPServer.Close()
> +@@ -1533,6 +1585,6 @@ func TestTrimURLPath(t *testing.T) {
> +       }
> +
> +       for _, test :=3D range tests {
> +-              assert.Equal(t, test.expected, trimURLPath(test.path), f=
mt.Sprintf("path is: %s", test.path))
> ++              assert.Equal(t, test.expected, getURLRootPath(test.path)=
, fmt.Sprintf("path is: %s", test.path))
> +       }
> + }
> +--
> +2.17.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpo=
int-for-resource-metrics.patch b/recipes-containers/kubernetes/kubernetes/0=
001-Add-new-endpoint-for-resource-metrics.patch
> new file mode 100644
> index 0000000..82e5fc6
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for=
-resource-metrics.patch
> @@ -0,0 +1,440 @@
> +From 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1 Mon Sep 17 00:00:00 2001
> +From: RainbowMango <renhongcai@huawei.com>
> +Date: Sun, 15 Dec 2019 17:06:13 +0800
> +Subject: [PATCH] Add new endpoint for resource metrics.
> +
> +This commit is required for context to fix CVE-2020-8551.
> +
> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/86282/commits/0db7074e1ad237af1a513bdf51160bf4b4cdc9f1]
> +CVE: CVE-2020-8551
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + .../metrics/collectors/resource_metrics.go    | 153 ++++++++++++++
> + .../collectors/resource_metrics_test.go       | 189 ++++++++++++++++++
> + pkg/kubelet/server/auth_test.go               |   1 +
> + pkg/kubelet/server/server.go                  |  23 ++-
> + 4 files changed, 358 insertions(+), 8 deletions(-)
> + create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics.go
> + create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics_tes=
t.go
> +
> +diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics=
.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
> +new file mode 100644
> +index 00000000000..a3667127903
> +--- /dev/null
> ++++ b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
> +@@ -0,0 +1,153 @@
> ++/*
> ++Copyright 2019 The Kubernetes Authors.
> ++
> ++Licensed under the Apache License, Version 2.0 (the "License");
> ++you may not use this file except in compliance with the License.
> ++You may obtain a copy of the License at
> ++
> ++    http://www.apache.org/licenses/LICENSE-2.0
> ++
> ++Unless required by applicable law or agreed to in writing, software
> ++distributed under the License is distributed on an "AS IS" BASIS,
> ++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implie=
d.
> ++See the License for the specific language governing permissions and
> ++limitations under the License.
> ++*/
> ++
> ++package collectors
> ++
> ++import (
> ++      "time"
> ++
> ++      "k8s.io/component-base/metrics"
> ++      "k8s.io/klog"
> ++      summary "k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1"
> ++      "k8s.io/kubernetes/pkg/kubelet/server/stats"
> ++)
> ++
> ++var (
> ++      nodeCPUUsageDesc =3D metrics.NewDesc("node_cpu_usage_seconds",
> ++              "Cumulative cpu time consumed by the node in core-second=
s",
> ++              nil,
> ++              nil,
> ++              metrics.ALPHA,
> ++              "")
> ++
> ++      nodeMemoryUsageDesc =3D metrics.NewDesc("node_memory_working_set=
_bytes",
> ++              "Current working set of the node in bytes",
> ++              nil,
> ++              nil,
> ++              metrics.ALPHA,
> ++              "")
> ++
> ++      containerCPUUsageDesc =3D metrics.NewDesc("container_cpu_usage_s=
econds",
> ++              "Cumulative cpu time consumed by the container in core-s=
econds",
> ++              []string{"container", "pod", "namespace"},
> ++              nil,
> ++              metrics.ALPHA,
> ++              "")
> ++
> ++      containerMemoryUsageDesc =3D metrics.NewDesc("container_memory_w=
orking_set_bytes",
> ++              "Current working set of the container in bytes",
> ++              []string{"container", "pod", "namespace"},
> ++              nil,
> ++              metrics.ALPHA,
> ++              "")
> ++
> ++      resouceScrapeResultDesc =3D metrics.NewDesc("scrape_error",
> ++              "1 if there was an error while getting container metrics=
, 0 otherwise",
> ++              nil,
> ++              nil,
> ++              metrics.ALPHA,
> ++              "")
> ++)
> ++
> ++// NewResourceMetricsCollector returns a metrics.StableCollector which=
 exports resource metrics
> ++func NewResourceMetricsCollector(provider stats.SummaryProvider) metri=
cs.StableCollector {
> ++      return &resourceMetricsCollector{
> ++              provider: provider,
> ++      }
> ++}
> ++
> ++type resourceMetricsCollector struct {
> ++      metrics.BaseStableCollector
> ++
> ++      provider stats.SummaryProvider
> ++}
> ++
> ++// Check if resourceMetricsCollector implements necessary interface
> ++var _ metrics.StableCollector =3D &resourceMetricsCollector{}
> ++
> ++// DescribeWithStability implements metrics.StableCollector
> ++func (rc *resourceMetricsCollector) DescribeWithStability(ch chan<- *m=
etrics.Desc) {
> ++      ch <- nodeCPUUsageDesc
> ++      ch <- nodeMemoryUsageDesc
> ++      ch <- containerCPUUsageDesc
> ++      ch <- containerMemoryUsageDesc
> ++      ch <- resouceScrapeResultDesc
> ++}
> ++
> ++// CollectWithStability implements metrics.StableCollector
> ++// Since new containers are frequently created and removed, using the =
Gauge would
> ++// leak metric collectors for containers or pods that no longer exist.=
  Instead, implement
> ++// custom collector in a way that only collects metrics for active con=
tainers.
> ++func (rc *resourceMetricsCollector) CollectWithStability(ch chan<- met=
rics.Metric) {
> ++      var errorCount float64
> ++      defer func() {
> ++              ch <- metrics.NewLazyConstMetric(resouceScrapeResultDesc=
, metrics.GaugeValue, errorCount)
> ++      }()
> ++      statsSummary, err :=3D rc.provider.GetCPUAndMemoryStats()
> ++      if err !=3D nil {
> ++              errorCount =3D 1
> ++              klog.Warningf("Error getting summary for resourceMetric =
prometheus endpoint: %v", err)
> ++              return
> ++      }
> ++
> ++      rc.collectNodeCPUMetrics(ch, statsSummary.Node)
> ++      rc.collectNodeMemoryMetrics(ch, statsSummary.Node)
> ++
> ++      for _, pod :=3D range statsSummary.Pods {
> ++              for _, container :=3D range pod.Containers {
> ++                      rc.collectContainerCPUMetrics(ch, pod, container=
)
> ++                      rc.collectContainerMemoryMetrics(ch, pod, contai=
ner)
> ++              }
> ++      }
> ++}
> ++
> ++func (rc *resourceMetricsCollector) collectNodeCPUMetrics(ch chan<- me=
trics.Metric, s summary.NodeStats) {
> ++      if s.CPU =3D=3D nil {
> ++              return
> ++      }
> ++
> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
> ++              metrics.NewLazyConstMetric(nodeCPUUsageDesc, metrics.Gau=
geValue, float64(*s.CPU.UsageCoreNanoSeconds)/float64(time.Second)))
> ++}
> ++
> ++func (rc *resourceMetricsCollector) collectNodeMemoryMetrics(ch chan<-=
 metrics.Metric, s summary.NodeStats) {
> ++      if s.Memory =3D=3D nil {
> ++              return
> ++      }
> ++
> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
> ++              metrics.NewLazyConstMetric(nodeMemoryUsageDesc, metrics.=
GaugeValue, float64(*s.Memory.WorkingSetBytes)))
> ++}
> ++
> ++func (rc *resourceMetricsCollector) collectContainerCPUMetrics(ch chan=
<- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
> ++      if s.CPU =3D=3D nil {
> ++              return
> ++      }
> ++
> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
> ++              metrics.NewLazyConstMetric(containerCPUUsageDesc, metric=
s.GaugeValue,
> ++                      float64(*s.CPU.UsageCoreNanoSeconds)/float64(tim=
e.Second), s.Name, pod.PodRef.Name, pod.PodRef.Namespace))
> ++}
> ++
> ++func (rc *resourceMetricsCollector) collectContainerMemoryMetrics(ch c=
han<- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
> ++      if s.Memory =3D=3D nil {
> ++              return
> ++      }
> ++
> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
> ++              metrics.NewLazyConstMetric(containerMemoryUsageDesc, met=
rics.GaugeValue,
> ++                      float64(*s.Memory.WorkingSetBytes), s.Name, pod.=
PodRef.Name, pod.PodRef.Namespace))
> ++}
> +diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics=
_test.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.=
go
> +new file mode 100644
> +index 00000000000..b92aabbd675
> +--- /dev/null
> ++++ b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.g=
o
> +@@ -0,0 +1,189 @@
> ++/*
> ++Copyright 2019 The Kubernetes Authors.
> ++
> ++Licensed under the Apache License, Version 2.0 (the "License");
> ++you may not use this file except in compliance with the License.
> ++You may obtain a copy of the License at
> ++
> ++    http://www.apache.org/licenses/LICENSE-2.0
> ++
> ++Unless required by applicable law or agreed to in writing, software
> ++distributed under the License is distributed on an "AS IS" BASIS,
> ++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implie=
d.
> ++See the License for the specific language governing permissions and
> ++limitations under the License.
> ++*/
> ++
> ++package collectors
> ++
> ++import (
> ++      "fmt"
> ++      "strings"
> ++      "testing"
> ++      "time"
> ++
> ++      "github.com/stretchr/testify/mock"
> ++
> ++      metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
> ++      "k8s.io/component-base/metrics/testutil"
> ++      statsapi "k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1"
> ++)
> ++
> ++type mockSummaryProvider struct {
> ++      mock.Mock
> ++}
> ++
> ++func (m *mockSummaryProvider) Get(updateStats bool) (*statsapi.Summary=
, error) {
> ++      args :=3D m.Called(updateStats)
> ++      return args.Get(0).(*statsapi.Summary), args.Error(1)
> ++}
> ++
> ++func (m *mockSummaryProvider) GetCPUAndMemoryStats() (*statsapi.Summar=
y, error) {
> ++      args :=3D m.Called()
> ++      return args.Get(0).(*statsapi.Summary), args.Error(1)
> ++}
> ++
> ++func TestCollectResourceMetrics(t *testing.T) {
> ++      testTime :=3D metav1.NewTime(time.Unix(2, 0)) // a static timest=
amp: 2000
> ++      interestedMetrics :=3D []string{
> ++              "scrape_error",
> ++              "node_cpu_usage_seconds",
> ++              "node_memory_working_set_bytes",
> ++              "container_cpu_usage_seconds",
> ++              "container_memory_working_set_bytes",
> ++      }
> ++
> ++      tests :=3D []struct {
> ++              name            string
> ++              summary         *statsapi.Summary
> ++              summaryErr      error
> ++              expectedMetrics string
> ++      }{
> ++              {
> ++                      name:       "error getting summary",
> ++                      summary:    nil,
> ++                      summaryErr: fmt.Errorf("failed to get summary"),
> ++                      expectedMetrics: `
> ++                              # HELP scrape_error [ALPHA] 1 if there w=
as an error while getting container metrics, 0 otherwise
> ++                              # TYPE scrape_error gauge
> ++                              scrape_error 1
> ++                      `,
> ++              },
> ++              {
> ++                      name: "arbitrary node metrics",
> ++                      summary: &statsapi.Summary{
> ++                              Node: statsapi.NodeStats{
> ++                                      CPU: &statsapi.CPUStats{
> ++                                              Time:                 te=
stTime,
> ++                                              UsageCoreNanoSeconds: ui=
nt64Ptr(10000000000),
> ++                                      },
> ++                                      Memory: &statsapi.MemoryStats{
> ++                                              Time:            testTim=
e,
> ++                                              WorkingSetBytes: uint64P=
tr(1000),
> ++                                      },
> ++                              },
> ++                      },
> ++                      summaryErr: nil,
> ++                      expectedMetrics: `
> ++                              # HELP node_cpu_usage_seconds [ALPHA] Cu=
mulative cpu time consumed by the node in core-seconds
> ++                              # TYPE node_cpu_usage_seconds gauge
> ++                              node_cpu_usage_seconds 10 2000
> ++                              # HELP node_memory_working_set_bytes [AL=
PHA] Current working set of the node in bytes
> ++                              # TYPE node_memory_working_set_bytes gau=
ge
> ++                              node_memory_working_set_bytes 1000 2000
> ++                              # HELP scrape_error [ALPHA] 1 if there w=
as an error while getting container metrics, 0 otherwise
> ++                              # TYPE scrape_error gauge
> ++                              scrape_error 0
> ++                      `,
> ++              },
> ++              {
> ++                      name: "arbitrary container metrics for different=
 container, pods and namespaces",
> ++                      summary: &statsapi.Summary{
> ++                              Pods: []statsapi.PodStats{
> ++                                      {
> ++                                              PodRef: statsapi.PodRefe=
rence{
> ++                                                      Name:      "pod_=
a",
> ++                                                      Namespace: "name=
space_a",
> ++                                              },
> ++                                              Containers: []statsapi.C=
ontainerStats{
> ++                                                      {
> ++                                                              Name: "c=
ontainer_a",
> ++                                                              CPU: &st=
atsapi.CPUStats{
> ++                                                                      =
Time:                 testTime,
> ++                                                                      =
UsageCoreNanoSeconds: uint64Ptr(10000000000),
> ++                                                              },
> ++                                                              Memory: =
&statsapi.MemoryStats{
> ++                                                                      =
Time:            testTime,
> ++                                                                      =
WorkingSetBytes: uint64Ptr(1000),
> ++                                                              },
> ++                                                      },
> ++                                                      {
> ++                                                              Name: "c=
ontainer_b",
> ++                                                              CPU: &st=
atsapi.CPUStats{
> ++                                                                      =
Time:                 testTime,
> ++                                                                      =
UsageCoreNanoSeconds: uint64Ptr(10000000000),
> ++                                                              },
> ++                                                              Memory: =
&statsapi.MemoryStats{
> ++                                                                      =
Time:            testTime,
> ++                                                                      =
WorkingSetBytes: uint64Ptr(1000),
> ++                                                              },
> ++                                                      },
> ++                                              },
> ++                                      },
> ++                                      {
> ++                                              PodRef: statsapi.PodRefe=
rence{
> ++                                                      Name:      "pod_=
b",
> ++                                                      Namespace: "name=
space_b",
> ++                                              },
> ++                                              Containers: []statsapi.C=
ontainerStats{
> ++                                                      {
> ++                                                              Name: "c=
ontainer_a",
> ++                                                              CPU: &st=
atsapi.CPUStats{
> ++                                                                      =
Time:                 testTime,
> ++                                                                      =
UsageCoreNanoSeconds: uint64Ptr(10000000000),
> ++                                                              },
> ++                                                              Memory: =
&statsapi.MemoryStats{
> ++                                                                      =
Time:            testTime,
> ++                                                                      =
WorkingSetBytes: uint64Ptr(1000),
> ++                                                              },
> ++                                                      },
> ++                                              },
> ++                                      },
> ++                              },
> ++                      },
> ++                      summaryErr: nil,
> ++                      expectedMetrics: `
> ++                              # HELP scrape_error [ALPHA] 1 if there w=
as an error while getting container metrics, 0 otherwise
> ++                              # TYPE scrape_error gauge
> ++                              scrape_error 0
> ++                              # HELP container_cpu_usage_seconds [ALPH=
A] Cumulative cpu time consumed by the container in core-seconds
> ++                              # TYPE container_cpu_usage_seconds gauge
> ++                              container_cpu_usage_seconds{container=3D=
"container_a",namespace=3D"namespace_a",pod=3D"pod_a"} 10 2000
> ++                              container_cpu_usage_seconds{container=3D=
"container_a",namespace=3D"namespace_b",pod=3D"pod_b"} 10 2000
> ++                              container_cpu_usage_seconds{container=3D=
"container_b",namespace=3D"namespace_a",pod=3D"pod_a"} 10 2000
> ++                              # HELP container_memory_working_set_byte=
s [ALPHA] Current working set of the container in bytes
> ++                              # TYPE container_memory_working_set_byte=
s gauge
> ++                              container_memory_working_set_bytes{conta=
iner=3D"container_a",namespace=3D"namespace_a",pod=3D"pod_a"} 1000 2000
> ++                              container_memory_working_set_bytes{conta=
iner=3D"container_a",namespace=3D"namespace_b",pod=3D"pod_b"} 1000 2000
> ++                              container_memory_working_set_bytes{conta=
iner=3D"container_b",namespace=3D"namespace_a",pod=3D"pod_a"} 1000 2000
> ++                      `,
> ++              },
> ++      }
> ++
> ++      for _, test :=3D range tests {
> ++              tc :=3D test
> ++              t.Run(tc.name, func(t *testing.T) {
> ++                      provider :=3D &mockSummaryProvider{}
> ++                      provider.On("GetCPUAndMemoryStats").Return(tc.su=
mmary, tc.summaryErr)
> ++                      collector :=3D NewResourceMetricsCollector(provi=
der)
> ++
> ++                      if err :=3D testutil.CustomCollectAndCompare(col=
lector, strings.NewReader(tc.expectedMetrics), interestedMetrics...); err !=
=
=3D nil {
> ++                              t.Fatal(err)
> ++                      }
> ++              })
> ++      }
> ++}
> ++
> ++func uint64Ptr(u uint64) *uint64 {
> ++      return &u
> ++}
> +diff --git a/src/import/pkg/kubelet/server/auth_test.go b/src/import/pk=
g/kubelet/server/auth_test.go
> +index d598bc3892b..638f3ba2bf0 100644
> +--- a/src/import/pkg/kubelet/server/auth_test.go
> ++++ b/src/import/pkg/kubelet/server/auth_test.go
> +@@ -128,6 +128,7 @@ func AuthzTestCases() []AuthzTestCase {
> +               "/metrics/cadvisor":                   "metrics",
> +               "/metrics/probes":                     "metrics",
> +               "/metrics/resource/v1alpha1":          "metrics",
> ++              "/metrics/resource":                   "metrics",
> +               "/pods/":                              "proxy",
> +               "/portForward/{podNamespace}/{podID}": "proxy",
> +               "/portForward/{podNamespace}/{podID}/{uid}":         "pr=
oxy",
> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/k=
ubelet/server/server.go
> +index 87f3bd28a25..74eeaf10171 100644
> +--- a/src/import/pkg/kubelet/server/server.go
> ++++ b/src/import/pkg/kubelet/server/server.go
> +@@ -38,6 +38,7 @@ import (
> +       "github.com/google/cadvisor/metrics"
> +       "google.golang.org/grpc"
> +       "k8s.io/klog"
> ++      "k8s.io/kubernetes/pkg/kubelet/metrics/collectors"
> +
> +       "k8s.io/api/core/v1"
> +       metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
> +@@ -74,13 +75,13 @@ import (
> + )
> +
> + const (
> +-      metricsPath               =3D "/metrics"
> +-      cadvisorMetricsPath       =3D "/metrics/cadvisor"
> +-      resourceMetricsPathPrefix =3D "/metrics/resource"
> +-      proberMetricsPath         =3D "/metrics/probes"
> +-      specPath                  =3D "/spec/"
> +-      statsPath                 =3D "/stats/"
> +-      logsPath                  =3D "/logs/"
> ++      metricsPath         =3D "/metrics"
> ++      cadvisorMetricsPath =3D "/metrics/cadvisor"
> ++      resourceMetricsPath =3D "/metrics/resource"
> ++      proberMetricsPath   =3D "/metrics/probes"
> ++      specPath            =3D "/spec/"
> ++      statsPath           =3D "/stats/"
> ++      logsPath            =3D "/logs/"
> + )
> +
> + // Server is a http.Handler which exposes kubelet functionality over H=
TTP.
> +@@ -321,10 +322,16 @@ func (s *Server) InstallDefaultHandlers(enableCAd=
visorJSONEndpoints bool) {
> +
> +       v1alpha1ResourceRegistry :=3D compbasemetrics.NewKubeRegistry()
> +       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusR=
esourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
> +-      s.restfulCont.Handle(path.Join(resourceMetricsPathPrefix, v1alph=
a1.Version),
> ++      s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Ver=
sion),
> +               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, com=
pbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
> +       )
> +
> ++      resourceRegistry :=3D compbasemetrics.NewKubeRegistry()
> ++      resourceRegistry.CustomMustRegister(collectors.NewResourceMetric=
sCollector(s.resourceAnalyzer))
> ++      s.restfulCont.Handle(resourceMetricsPath,
> ++              compbasemetrics.HandlerFor(resourceRegistry, compbasemet=
rics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
> ++      )
> ++
> +       // prober metrics are exposed under a different endpoint
> +
> +       p :=3D compbasemetrics.NewKubeRegistry()
> +--
> +2.20.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Deal-with-aut=
o-generated-files.patch b/recipes-containers/kubernetes/kubernetes/0001-Dea=
l-with-auto-generated-files.patch
> new file mode 100644
> index 0000000..f7a5c7c
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-gener=
ated-files.patch
> @@ -0,0 +1,60 @@
> +From c394d821fdafd719619eb63fcd1065a95ec02ef9 Mon Sep 17 00:00:00 2001
> +From: RainbowMango <renhongcai@huawei.com>
> +Date: Sun, 15 Dec 2019 18:37:38 +0800
> +Subject: [PATCH] Deal with auto-generated files: - Update bazel by
> + hack/update-bazel.sh
> +
> +This commit is needed for context to fix CVE-2020-8551
> +
> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/86282/commits/c394d821fdafd719619eb63fcd1065a95ec02ef9]
> +CVE: CVE-2020-8551
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + pkg/kubelet/metrics/collectors/BUILD | 3 +++
> + pkg/kubelet/server/BUILD             | 1 +
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/src/import/pkg/kubelet/metrics/collectors/BUILD b/src/impo=
rt/pkg/kubelet/metrics/collectors/BUILD
> +index 00bc335320f..25398793eab 100644
> +--- a/src/import/pkg/kubelet/metrics/collectors/BUILD
> ++++ b/src/import/pkg/kubelet/metrics/collectors/BUILD
> +@@ -4,6 +4,7 @@ go_library(
> +     name =3D "go_default_library",
> +     srcs =3D [
> +         "log_metrics.go",
> ++        "resource_metrics.go",
> +         "volume_stats.go",
> +     ],
> +     importpath =3D "k8s.io/kubernetes/pkg/kubelet/metrics/collectors",
> +@@ -22,6 +23,7 @@ go_test(
> +     name =3D "go_default_test",
> +     srcs =3D [
> +         "log_metrics_test.go",
> ++        "resource_metrics_test.go",
> +         "volume_stats_test.go",
> +     ],
> +     embed =3D [":go_default_library"],
> +@@ -30,6 +32,7 @@ go_test(
> +         "//pkg/kubelet/server/stats/testing:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_default=
_library",
> +         "//staging/src/k8s.io/component-base/metrics/testutil:go_defau=
lt_library",
> ++        "//vendor/github.com/stretchr/testify/mock:go_default_library"=
,
> +     ],
> + )
> +
> +diff --git a/src/import/pkg/kubelet/server/BUILD b/src/import/pkg/kubel=
et/server/BUILD
> +index d83619fcbe5..a18f1b5e83b 100644
> +--- a/src/import/pkg/kubelet/server/BUILD
> ++++ b/src/import/pkg/kubelet/server/BUILD
> +@@ -22,6 +22,7 @@ go_library(
> +         "//pkg/kubelet/apis/podresources/v1alpha1:go_default_library",
> +         "//pkg/kubelet/apis/resourcemetrics/v1alpha1:go_default_librar=
y",
> +         "//pkg/kubelet/container:go_default_library",
> ++        "//pkg/kubelet/metrics/collectors:go_default_library",
> +         "//pkg/kubelet/prober:go_default_library",
> +         "//pkg/kubelet/server/metrics:go_default_library",
> +         "//pkg/kubelet/server/portforward:go_default_library",
> +--
> +2.20.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-remove-client=
-label-from-apiserver-request-count-met.patch b/recipes-containers/kubernet=
es/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.pat=
ch
> new file mode 100644
> index 0000000..d4bf783
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-=
from-apiserver-request-count-met.patch
> @@ -0,0 +1,171 @@
> +From a657089732c0bd5d4515fb9208182c31c6c05790 Mon Sep 17 00:00:00 2001
> +From: Han Kang <hankang@google.com>
> +Date: Wed, 29 Jan 2020 12:25:55 -0800
> +Subject: [PATCH] remove client label from apiserver request count metri=
c since
> + it is unbounded
> +
> +Change-Id: I3a9eacebc9d9dc9ed6347260d9378cdcb5743431
> +
> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/87669/commits/cc3190968b1f14ddf4067abef849fc41bd6068dc]
> +CVE: CVE-2020-8552
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + .../apiserver/pkg/endpoints/metrics/BUILD     |  8 ---
> + .../pkg/endpoints/metrics/metrics.go          | 23 ++------
> + .../pkg/endpoints/metrics/metrics_test.go     | 54 -------------------
> + 3 files changed, 4 insertions(+), 81 deletions(-)
> + delete mode 100644 staging/src/k8s.io/apiserver/pkg/endpoints/metrics/=
metrics_test.go
> +
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metr=
ics/BUILD b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/B=
UILD
> +index 8d13a34eadc..8abb3d1a611 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUI=
LD
> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUI=
LD
> +@@ -3,13 +3,6 @@ package(default_visibility =3D ["//visibility:public"]=
)
> + load(
> +     "@io_bazel_rules_go//go:def.bzl",
> +     "go_library",
> +-    "go_test",
> +-)
> +-
> +-go_test(
> +-    name =3D "go_default_test",
> +-    srcs =3D ["metrics_test.go"],
> +-    embed =3D [":go_default_library"],
> + )
> +
> + go_library(
> +@@ -20,7 +13,6 @@ go_library(
> +     deps =3D [
> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1/validation=
:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/types:go_default_librar=
y",
> +-        "//staging/src/k8s.io/apimachinery/pkg/util/net:go_default_lib=
rary",
> +         "//staging/src/k8s.io/apimachinery/pkg/util/sets:go_default_li=
brary",
> +         "//staging/src/k8s.io/apiserver/pkg/endpoints/request:go_defau=
lt_library",
> +         "//staging/src/k8s.io/apiserver/pkg/features:go_default_librar=
y",
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metr=
ics/metrics.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metr=
ics/metrics.go
> +index 36ff861da7a..81a9a2c5e6f 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/met=
rics.go
> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/met=
rics.go
> +@@ -31,7 +31,6 @@ import (
> +
> +       "k8s.io/apimachinery/pkg/apis/meta/v1/validation"
> +       "k8s.io/apimachinery/pkg/types"
> +-      utilnet "k8s.io/apimachinery/pkg/util/net"
> +       utilsets "k8s.io/apimachinery/pkg/util/sets"
> +       "k8s.io/apiserver/pkg/endpoints/request"
> +       "k8s.io/apiserver/pkg/features"
> +@@ -65,14 +64,14 @@ var (
> +       requestCounter =3D compbasemetrics.NewCounterVec(
> +               &compbasemetrics.CounterOpts{
> +                       Name:           "apiserver_request_total",
> +-                      Help:           "Counter of apiserver requests b=
roken out for each verb, dry run value, group, version, resource, scope, co=
mponent, client, and HTTP response contentType and code.",
> ++                      Help:           "Counter of apiserver requests b=
roken out for each verb, dry run value, group, version, resource, scope, co=
mponent, and HTTP response contentType and code.",
> +                       StabilityLevel: compbasemetrics.ALPHA,
> +               },
> +               // The label_name contentType doesn't follow the label_n=
ame convention defined here:
> +               // https://github.com/kubernetes/community/blob/master/c=
ontributors/devel/sig-instrumentation/instrumentation.md
> +               // But changing it would break backwards compatibility. =
Future label_names
> +               // should be all lowercase and separated by underscores.
> +-              []string{"verb", "dry_run", "group", "version", "resourc=
e", "subresource", "scope", "component", "client", "contentType", "code"},
> ++              []string{"verb", "dry_run", "group", "version", "resourc=
e", "subresource", "scope", "component", "contentType", "code"},
> +       )
> +       deprecatedRequestCounter =3D compbasemetrics.NewCounterVec(
> +               &compbasemetrics.CounterOpts{
> +@@ -301,11 +300,10 @@ func RecordLongRunning(req *http.Request, request=
Info *request.RequestInfo, comp
> + func MonitorRequest(req *http.Request, verb, group, version, resource,=
 subresource, scope, component, contentType string, httpCode, respSize int,=
 elapsed time.Duration) {
> +       reportedVerb :=3D cleanVerb(verb, req)
> +       dryRun :=3D cleanDryRun(req.URL)
> +-      client :=3D cleanUserAgent(utilnet.GetHTTPClient(req))
> +       elapsedMicroseconds :=3D float64(elapsed / time.Microsecond)
> +       elapsedSeconds :=3D elapsed.Seconds()
> +-      requestCounter.WithLabelValues(reportedVerb, dryRun, group, vers=
ion, resource, subresource, scope, component, client, contentType, codeToSt=
ring(httpCode)).Inc()
> +-      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, ve=
rsion, resource, subresource, scope, component, client, contentType, codeTo=
String(httpCode)).Inc()
> ++      requestCounter.WithLabelValues(reportedVerb, dryRun, group, vers=
ion, resource, subresource, scope, component, contentType, codeToString(htt=
pCode)).Inc()
> ++      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, ve=
rsion, resource, subresource, scope, component, contentType, codeToString(h=
ttpCode)).Inc()
> +       requestLatencies.WithLabelValues(reportedVerb, dryRun, group, ve=
rsion, resource, subresource, scope, component).Observe(elapsedSeconds)
> +       deprecatedRequestLatencies.WithLabelValues(reportedVerb, group, =
version, resource, subresource, scope, component).Observe(elapsedMicrosecon=
ds)
> +       deprecatedRequestLatenciesSummary.WithLabelValues(reportedVerb, =
group, version, resource, subresource, scope, component).Observe(elapsedMic=
roseconds)
> +@@ -425,19 +423,6 @@ func cleanDryRun(u *url.URL) string {
> +       return strings.Join(utilsets.NewString(dryRun...).List(), ",")
> + }
> +
> +-func cleanUserAgent(ua string) string {
> +-      // We collapse all "web browser"-type user agents into one "brow=
ser" to reduce metric cardinality.
> +-      if strings.HasPrefix(ua, "Mozilla/") {
> +-              return "Browser"
> +-      }
> +-      // If an old "kubectl.exe" has passed us its full path, we disca=
rd the path portion.
> +-      if kubectlExeRegexp.MatchString(ua) {
> +-              // avoid an allocation
> +-              ua =3D kubectlExeRegexp.ReplaceAllString(ua, "$1")
> +-      }
> +-      return ua
> +-}
> +-
> + // ResponseWriterDelegator interface wraps http.ResponseWriter to addi=
tionally record content-length, status-code, etc.
> + type ResponseWriterDelegator struct {
> +       http.ResponseWriter
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metr=
ics/metrics_test.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints=
/metrics/metrics_test.go
> +deleted file mode 100644
> +index 4c0a8aa5d27..00000000000
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/met=
rics_test.go
> ++++ /dev/null
> +@@ -1,54 +0,0 @@
> +-/*
> +-Copyright 2015 The Kubernetes Authors.
> +-
> +-Licensed under the Apache License, Version 2.0 (the "License");
> +-you may not use this file except in compliance with the License.
> +-You may obtain a copy of the License at
> +-
> +-    http://www.apache.org/licenses/LICENSE-2.0
> +-
> +-Unless required by applicable law or agreed to in writing, software
> +-distributed under the License is distributed on an "AS IS" BASIS,
> +-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implie=
d.
> +-See the License for the specific language governing permissions and
> +-limitations under the License.
> +-*/
> +-
> +-package metrics
> +-
> +-import "testing"
> +-
> +-func TestCleanUserAgent(t *testing.T) {
> +-      panicBuf :=3D []byte{198, 73, 129, 133, 90, 216, 104, 29, 13, 13=
4, 209, 233, 30, 0, 22}
> +-
> +-      for _, tc :=3D range []struct {
> +-              In  string
> +-              Out string
> +-      }{
> +-              {
> +-                      In:  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_=
11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/53=
7.36",
> +-                      Out: "Browser",
> +-              },
> +-              {
> +-                      In:  "kubectl/v1.2.4",
> +-                      Out: "kubectl/v1.2.4",
> +-              },
> +-              {
> +-                      In:  `C:\Users\Kubernetes\kubectl.exe/v1.5.4`,
> +-                      Out: "kubectl.exe/v1.5.4",
> +-              },
> +-              {
> +-                      In:  `C:\Program Files\kubectl.exe/v1.5.4`,
> +-                      Out: "kubectl.exe/v1.5.4",
> +-              },
> +-              {
> +-                      // This malicious input courtesy of enisoc.
> +-                      In:  string(panicBuf) + "kubectl.exe",
> +-                      Out: "kubectl.exe",
> +-              },
> +-      } {
> +-              if cleanUserAgent(tc.In) !=3D tc.Out {
> +-                      t.Errorf("Failed to clean User-Agent: %s", tc.In=
)
> +-              }
> +-      }
> +-}
> +--
> +2.17.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.=
in-yaml.v2-to-v2.2.8.patch b/recipes-containers/kubernetes/kubernetes/0001-=
update-gopkg.in-yaml.v2-to-v2.2.8.patch
> new file mode 100644
> index 0000000..2688797
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml=
.v2-to-v2.2.8.patch
> @@ -0,0 +1,825 @@
> +From a290fe55cb2f4593eb4ec5bf410cd77b9d925464 Mon Sep 17 00:00:00 2001
> +From: CJ Cullen <cjcullen@google.com>
> +Date: Wed, 22 Jan 2020 11:32:39 -0800
> +Subject: [PATCH] update gopkg.in/yaml.v2 to v2.2.8
> +
> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pul=
l/87637/commits/a290fe55cb2f4593eb4ec5bf410cd77b9d925464]
> +CVE: CVE-2019-11254
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + go.mod                                        |   4 +-
> + go.sum                                        |   4 +-
> + staging/src/k8s.io/api/go.sum                 |   4 +-
> + .../src/k8s.io/apiextensions-apiserver/go.mod |   2 +-
> + .../src/k8s.io/apiextensions-apiserver/go.sum |   2 +
> + staging/src/k8s.io/apimachinery/go.mod        |   2 +-
> + staging/src/k8s.io/apimachinery/go.sum        |   4 +-
> + staging/src/k8s.io/apiserver/go.mod           |   2 +-
> + staging/src/k8s.io/apiserver/go.sum           |   4 +-
> + staging/src/k8s.io/cli-runtime/go.sum         |   4 +-
> + staging/src/k8s.io/client-go/go.sum           |   4 +-
> + staging/src/k8s.io/cloud-provider/go.sum      |   4 +-
> + staging/src/k8s.io/cluster-bootstrap/go.sum   |   4 +-
> + staging/src/k8s.io/code-generator/go.mod      |   2 +-
> + staging/src/k8s.io/code-generator/go.sum      |   4 +-
> + staging/src/k8s.io/component-base/go.sum      |   4 +-
> + staging/src/k8s.io/cri-api/go.mod             |   2 +-
> + staging/src/k8s.io/cri-api/go.sum             |   4 +-
> + staging/src/k8s.io/csi-translation-lib/go.sum |   4 +-
> + staging/src/k8s.io/kube-aggregator/go.sum     |   4 +-
> + .../src/k8s.io/kube-controller-manager/go.sum |   4 +-
> + staging/src/k8s.io/kube-proxy/go.sum          |   4 +-
> + staging/src/k8s.io/kube-scheduler/go.sum      |   4 +-
> + staging/src/k8s.io/kubectl/go.mod             |   2 +-
> + staging/src/k8s.io/kubectl/go.sum             |   4 +-
> + staging/src/k8s.io/kubelet/go.sum             |   4 +-
> + .../src/k8s.io/legacy-cloud-providers/go.sum  |   4 +-
> + staging/src/k8s.io/metrics/go.sum             |   4 +-
> + staging/src/k8s.io/node-api/go.sum            |   4 +-
> + staging/src/k8s.io/sample-apiserver/go.sum    |   4 +-
> + staging/src/k8s.io/sample-cli-plugin/go.sum   |   4 +-
> + staging/src/k8s.io/sample-controller/go.sum   |   4 +-
> + vendor/gopkg.in/yaml.v2/.travis.yml           |  18 +--
> + vendor/gopkg.in/yaml.v2/decode.go             |  14 ++-
> + vendor/gopkg.in/yaml.v2/scannerc.go           | 107 +++++++++---------
> + vendor/gopkg.in/yaml.v2/yaml.go               |   2 +-
> + vendor/gopkg.in/yaml.v2/yamlh.go              |   1 +
> + vendor/modules.txt                            |   2 +-
> + 38 files changed, 133 insertions(+), 125 deletions(-)
> +
> +diff --git a/src/import/go.mod b/src/import/go.mod
> +index 7d515c2ffb0..28de082aa0d 100644
> +--- a/src/import/go.mod
> ++++ b/src/import/go.mod
> +@@ -131,7 +131,7 @@ require (
> +       google.golang.org/grpc v1.23.1
> +       gopkg.in/gcfg.v1 v1.2.0
> +       gopkg.in/square/go-jose.v2 v2.2.2
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible
> +       gotest.tools/gotestsum v0.3.5
> +       honnef.co/go/tools v0.0.1-2019.2.2
> +@@ -518,7 +518,7 @@ replace (
> +       gopkg.in/square/go-jose.v2 =3D> gopkg.in/square/go-jose.v2 v2.2.=
2
> +       gopkg.in/tomb.v1 =3D> gopkg.in/tomb.v1 v1.0.0-20141024135613-dd6=
32973f1e7
> +       gopkg.in/warnings.v0 =3D> gopkg.in/warnings.v0 v0.1.1
> +-      gopkg.in/yaml.v2 =3D> gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 =3D> gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools =3D> gotest.tools v2.2.0+incompatible
> +       gotest.tools/gotestsum =3D> gotest.tools/gotestsum v0.3.5
> +       grpc.go4.org =3D> grpc.go4.org v0.0.0-20170609214715-11d0a25b491=
9
> +diff --git a/src/import/go.sum b/src/import/go.sum
> +index 72d79cb27b2..43aaee0e578 100644
> +--- a/src/import/go.sum
> ++++ b/src/import/go.sum
> +@@ -574,8 +574,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7=
 h1:uRGJdciOHaEIrze2W8Q3AKkep
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58=
zS4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/warnings.v0 v0.1.1 h1:XM28wIgFzaBmeZ5dNHIpWLQpt/9DGKxk+rCg/22=
nnYE=3D
> + gopkg.in/warnings.v0 v0.1.1/go.mod h1:jksf8JmL6Qr/oQM2OXTHunEvvTAsrWBL=
b6OOjuVWRNI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJj=
fM+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + gotest.tools/gotestsum v0.3.5 h1:VePOWRsuWFYpfp/G8mbmOZKxO5T3501SEGQRU=
dvq7h0=3D
> +diff --git a/src/import/staging/src/k8s.io/api/go.sum b/src/importsrc/i=
mport/staging/src/k8s.io/api/go.sum
> +index 08ad9edc62a..73199a7c13e 100644
> +--- a/src/import/staging/src/k8s.io/api/go.sum
> ++++ b/src/import/staging/src/k8s.io/api/go.sum
> +@@ -95,8 +95,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/g=
o.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/H=
Rz0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=3D
> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.m=
od b/src/importsrc/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> +index 97014a76a68..499daf4ffa7 100644
> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> +@@ -20,7 +20,7 @@ require (
> +       github.com/stretchr/testify v1.4.0
> +       go.etcd.io/etcd v0.0.0-20191023171146-3cf2f69b5738
> +       google.golang.org/grpc v1.23.1
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +       k8s.io/apiserver v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.s=
um b/src/importstaging/src/k8s.io/apiextensions-apiserver/go.sum
> +index 6f8bd4918ce..ef6973e4220 100644
> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
> +@@ -449,6 +449,8 @@ gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8=
Qj64Jo6az82+3Td9dZw=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> + gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.mod b/src/im=
portstaging/src/k8s.io/apimachinery/go.mod
> +index 85bd7edfc84..569aa8941c4 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/go.mod
> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.mod
> +@@ -30,7 +30,7 @@ require (
> +       golang.org/x/text v0.3.2 // indirect
> +       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
> +       gopkg.in/inf.v0 v0.9.1
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       k8s.io/klog v1.0.0
> +       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
> +       sigs.k8s.io/yaml v1.1.0
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.sum b/src/im=
portstaging/src/k8s.io/apimachinery/go.sum
> +index 52ad8335f42..0741a85da3f 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/go.sum
> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.sum
> +@@ -111,8 +111,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7=
/go.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/H=
Rz0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=3D
> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.mod b/src/impor=
tstaging/src/k8s.io/apiserver/go.mod
> +index 01b925bab48..6586e6680cb 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/go.mod
> ++++ b/src/import/staging/src/k8s.io/apiserver/go.mod
> +@@ -42,7 +42,7 @@ require (
> +       google.golang.org/grpc v1.23.1
> +       gopkg.in/natefinch/lumberjack.v2 v2.0.0
> +       gopkg.in/square/go-jose.v2 v2.2.2
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible // indirect
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.sum b/src/impor=
tstaging/src/k8s.io/apiserver/go.sum
> +index a9014243b34..0b216e592e4 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/apiserver/go.sum
> +@@ -345,8 +345,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJj=
fM+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/cli-runtime/go.sum b/src/imp=
ortstaging/src/k8s.io/cli-runtime/go.sum
> +index a5eef73070b..c6c2d0d9231 100644
> +--- a/src/import/staging/src/k8s.io/cli-runtime/go.sum
> ++++ b/src/import/staging/src/k8s.io/cli-runtime/go.sum
> +@@ -234,8 +234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/client-go/go.sum b/src/impor=
tstaging/src/k8s.io/client-go/go.sum
> +index d0df7473b3e..f8f205a69d7 100644
> +--- a/src/import/staging/src/k8s.io/client-go/go.sum
> ++++ b/src/import/staging/src/k8s.io/client-go/go.sum
> +@@ -189,8 +189,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/cloud-provider/go.sum b/src/=
importstaging/src/k8s.io/cloud-provider/go.sum
> +index 8ccf452dc8d..74228199881 100644
> +--- a/src/import/staging/src/k8s.io/cloud-provider/go.sum
> ++++ b/src/import/staging/src/k8s.io/cloud-provider/go.sum
> +@@ -171,8 +171,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum b/s=
rc/importstaging/src/k8s.io/cluster-bootstrap/go.sum
> +index 8d81d0563ea..4c58905c7d8 100644
> +--- a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
> ++++ b/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
> +@@ -99,8 +99,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/g=
o.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/H=
Rz0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=3D
> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.mod b/src/=
importstaging/src/k8s.io/code-generator/go.mod
> +index 69a9e1cd9f2..2436804e8f0 100644
> +--- a/src/import/staging/src/k8s.io/code-generator/go.mod
> ++++ b/src/import/staging/src/k8s.io/code-generator/go.mod
> +@@ -18,7 +18,7 @@ require (
> +       golang.org/x/tools v0.0.0-20190920225731-5eefd052ad72 // indirec=
t
> +       gonum.org/v1/gonum v0.0.0-20190331200053-3d26580ed485
> +       gonum.org/v1/netlib v0.0.0-20190331212654-76723241ea4e // indire=
ct
> +-      gopkg.in/yaml.v2 v2.2.4 // indirect
> ++      gopkg.in/yaml.v2 v2.2.8 // indirect
> +       k8s.io/gengo v0.0.0-20190822140433-26a664648505
> +       k8s.io/klog v1.0.0
> +       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.sum b/src/=
importstaging/src/k8s.io/code-generator/go.sum
> +index 7bab2c9efd3..afc21aae562 100644
> +--- a/src/import/staging/src/k8s.io/code-generator/go.sum
> ++++ b/src/import/staging/src/k8s.io/code-generator/go.sum
> +@@ -114,8 +114,8 @@ gopkg.in/check.v1 v1.0.0-20180628173108-788fd784012=
7/go.mod h1:Co6ibVJAznAaIkqp8
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZ=
KjQ04WJ6EhQQVFdjOFvCazDk=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/gengo v0.0.0-20190822140433-26a664648505 h1:ZY6yclUKVbZ+SdWnkfY=
+Je5vrMpKOxmGeKRbsXVmqYM=3D
> +diff --git a/src/import/staging/src/k8s.io/component-base/go.sum b/src/=
importstaging/src/k8s.io/component-base/go.sum
> +index b6af501ac2e..6c54e8b74e0 100644
> +--- a/src/import/staging/src/k8s.io/component-base/go.sum
> ++++ b/src/import/staging/src/k8s.io/component-base/go.sum
> +@@ -210,8 +210,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/cri-api/go.mod b/src/imports=
taging/src/k8s.io/cri-api/go.mod
> +index de2050e54af..4f8315dcfcc 100644
> +--- a/src/import/staging/src/k8s.io/cri-api/go.mod
> ++++ b/src/import/staging/src/k8s.io/cri-api/go.mod
> +@@ -16,7 +16,7 @@ require (
> +       google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873 //=
 indirect
> +       google.golang.org/grpc v1.23.1
> +       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
> +-      gopkg.in/yaml.v2 v2.2.4 // indirect
> ++      gopkg.in/yaml.v2 v2.2.8 // indirect
> + )
> +
> + replace (
> +diff --git a/src/import/staging/src/k8s.io/cri-api/go.sum b/src/imports=
taging/src/k8s.io/cri-api/go.sum
> +index 880169cf1dc..5340741af79 100644
> +--- a/src/import/staging/src/k8s.io/cri-api/go.sum
> ++++ b/src/import/staging/src/k8s.io/cri-api/go.sum
> +@@ -59,7 +59,7 @@ gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/=
go.mod h1:Co6ibVJAznAaIkqp8
> + gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 h1:qIbj1fsPNlZgpp=
Z+VLlY7N33q108Sa+fhmuc+sWQYwY=3D
> + gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod h1:Co6ibVJ=
AznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum b=
/src/importstaging/src/k8s.io/csi-translation-lib/go.sum
> +index 2cb7a51b2a4..f918afd9078 100644
> +--- a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
> ++++ b/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
> +@@ -154,8 +154,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-aggregator/go.sum b/src=
/importstaging/src/k8s.io/kube-aggregator/go.sum
> +index bfcd7b4aa8a..d29c2136442 100644
> +--- a/src/import/staging/src/k8s.io/kube-aggregator/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-aggregator/go.sum
> +@@ -378,8 +378,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-controller-manager/go.s=
um b/src/importstaging/src/k8s.io/kube-controller-manager/go.sum
> +index 5303a3606b3..b238ae9cbbb 100644
> +--- a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-proxy/go.sum b/src/impo=
rtstaging/src/k8s.io/kube-proxy/go.sum
> +index 5303a3606b3..b238ae9cbbb 100644
> +--- a/src/import/staging/src/k8s.io/kube-proxy/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-proxy/go.sum
> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-scheduler/go.sum b/src/=
importstaging/src/k8s.io/kube-scheduler/go.sum
> +index 5303a3606b3..b238ae9cbbb 100644
> +--- a/src/import/staging/src/k8s.io/kube-scheduler/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-scheduler/go.sum
> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.mod b/src/imports=
taging/src/k8s.io/kubectl/go.mod
> +index e0111ac16bf..c646296ebb1 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/go.mod
> ++++ b/src/import/staging/src/k8s.io/kubectl/go.mod
> +@@ -34,7 +34,7 @@ require (
> +       github.com/stretchr/testify v1.4.0
> +       github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1 // =
indirect
> +       golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible // indirect
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.sum b/src/imports=
taging/src/k8s.io/kubectl/go.sum
> +index 95ba529852c..1db9943f53c 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/go.sum
> ++++ b/src/import/staging/src/k8s.io/kubectl/go.sum
> +@@ -317,8 +317,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7=
/go.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJj=
fM+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/kubelet/go.sum b/src/imports=
taging/src/k8s.io/kubelet/go.sum
> +index f42a61078c9..57a0c633583 100644
> +--- a/src/import/staging/src/k8s.io/kubelet/go.sum
> ++++ b/src/import/staging/src/k8s.io/kubelet/go.sum
> +@@ -119,8 +119,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7=
/go.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.su=
m b/src/importstaging/src/k8s.io/legacy-cloud-providers/go.sum
> +index 99f76dac0cc..9e990dff888 100644
> +--- a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
> ++++ b/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
> +@@ -340,8 +340,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/metrics/go.sum b/src/imports=
taging/src/k8s.io/metrics/go.sum
> +index 99df273ff9e..d9b2c94fdbe 100644
> +--- a/src/import/staging/src/k8s.io/metrics/go.sum
> ++++ b/src/import/staging/src/k8s.io/metrics/go.sum
> +@@ -211,8 +211,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZ=
KjQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/staging/src/k8s.io/node-api/go.sum b/src/import=
staging/src/k8s.io/node-api/go.sum
> +index 77f0a21fa7d..1cb50186d99 100644
> +--- a/src/import/staging/src/k8s.io/node-api/go.sum
> ++++ b/src/import/staging/src/k8s.io/node-api/go.sum
> +@@ -215,8 +215,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZ=
KjQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-apiserver/go.sum b/sr=
c/importstaging/src/k8s.io/sample-apiserver/go.sum
> +index 3ea72ac63e9..236ee4b1e88 100644
> +--- a/src/import/staging/src/k8s.io/sample-apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-apiserver/go.sum
> +@@ -375,8 +375,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2s=
xOXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum b/s=
rc/importstaging/src/k8s.io/sample-cli-plugin/go.sum
> +index a5eef73070b..c6c2d0d9231 100644
> +--- a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
> +@@ -234,8 +234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6=
rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-controller/go.sum b/s=
rc/importstaging/src/k8s.io/sample-controller/go.sum
> +index 55fa85acf16..3b18f34b5a6 100644
> +--- a/src/import/staging/src/k8s.io/sample-controller/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-controller/go.sum
> +@@ -216,8 +216,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91=
YhliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+=
5A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4=
BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZ=
KjQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml b/src/impor=
tvendor/gopkg.in/yaml.v2/.travis.yml
> +index 9f556934d8b..055480b9ef8 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
> +@@ -1,12 +1,16 @@
> + language: go
> +
> + go:
> +-    - 1.4
> +-    - 1.5
> +-    - 1.6
> +-    - 1.7
> +-    - 1.8
> +-    - 1.9
> +-    - tip
> ++    - "1.4.x"
> ++    - "1.5.x"
> ++    - "1.6.x"
> ++    - "1.7.x"
> ++    - "1.8.x"
> ++    - "1.9.x"
> ++    - "1.10.x"
> ++    - "1.11.x"
> ++    - "1.12.x"
> ++    - "1.13.x"
> ++    - "tip"
> +
> + go_import_path: gopkg.in/yaml.v2
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/decode.go b/src/importv=
endor/gopkg.in/yaml.v2/decode.go
> +index 53108765555..129bc2a97d3 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/decode.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/decode.go
> +@@ -319,10 +319,14 @@ func (d *decoder) prepare(n *node, out reflect.Va=
lue) (newout reflect.Value, unm
> + }
> +
> + const (
> +-      // 400,000 decode operations is ~500kb of dense object declarati=
ons, or ~5kb of dense object declarations with 10000% alias expansion
> ++      // 400,000 decode operations is ~500kb of dense object declarati=
ons, or
> ++      // ~5kb of dense object declarations with 10000% alias expansion
> +       alias_ratio_range_low =3D 400000
> +-      // 4,000,000 decode operations is ~5MB of dense object declarati=
ons, or ~4.5MB of dense object declarations with 10% alias expansion
> ++
> ++      // 4,000,000 decode operations is ~5MB of dense object declarati=
ons, or
> ++      // ~4.5MB of dense object declarations with 10% alias expansion
> +       alias_ratio_range_high =3D 4000000
> ++
> +       // alias_ratio_range is the range over which we scale allowed al=
ias ratios
> +       alias_ratio_range =3D float64(alias_ratio_range_high - alias_rat=
io_range_low)
> + )
> +@@ -784,8 +788,7 @@ func (d *decoder) merge(n *node, out reflect.Value)=
 {
> +       case mappingNode:
> +               d.unmarshal(n, out)
> +       case aliasNode:
> +-              an, ok :=3D d.doc.anchors[n.value]
> +-              if ok && an.kind !=3D mappingNode {
> ++              if n.alias !=3D nil && n.alias.kind !=3D mappingNode {
> +                       failWantMap()
> +               }
> +               d.unmarshal(n, out)
> +@@ -794,8 +797,7 @@ func (d *decoder) merge(n *node, out reflect.Value)=
 {
> +               for i :=3D len(n.children) - 1; i >=3D 0; i-- {
> +                       ni :=3D n.children[i]
> +                       if ni.kind =3D=3D aliasNode {
> +-                              an, ok :=3D d.doc.anchors[ni.value]
> +-                              if ok && an.kind !=3D mappingNode {
> ++                              if ni.alias !=3D nil && ni.alias.kind !=
=3D mappingNode {
> +                                       failWantMap()
> +                               }
> +                       } else if ni.kind !=3D mappingNode {
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go b/src/impor=
tvendor/gopkg.in/yaml.v2/scannerc.go
> +index 570b8ecd10f..0b9bb6030a0 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
> +@@ -626,31 +626,18 @@ func trace(args ...interface{}) func() {
> + func yaml_parser_fetch_more_tokens(parser *yaml_parser_t) bool {
> +       // While we need more tokens to fetch, do it.
> +       for {
> +-              // Check if we really need to fetch more tokens.
> +-              need_more_tokens :=3D false
> +-
> +-              if parser.tokens_head =3D=3D len(parser.tokens) {
> +-                      // Queue is empty.
> +-                      need_more_tokens =3D true
> +-              } else {
> +-                      // Check if any potential simple key may occupy =
the head position.
> +-                      if !yaml_parser_stale_simple_keys(parser) {
> ++              if parser.tokens_head !=3D len(parser.tokens) {
> ++                      // If queue is non-empty, check if any potential=
 simple key may
> ++                      // occupy the head position.
> ++                      head_tok_idx, ok :=3D parser.simple_keys_by_tok[=
parser.tokens_parsed]
> ++                      if !ok {
> ++                              break
> ++                      } else if valid, ok :=3D yaml_simple_key_is_vali=
d(parser, &parser.simple_keys[head_tok_idx]); !ok {
> +                               return false
> +-                      }
> +-
> +-                      for i :=3D range parser.simple_keys {
> +-                              simple_key :=3D &parser.simple_keys[i]
> +-                              if simple_key.possible && simple_key.tok=
en_number =3D=3D parser.tokens_parsed {
> +-                                      need_more_tokens =3D true
> +-                                      break
> +-                              }
> ++                      } else if !valid {
> ++                              break
> +                       }
> +               }
> +-
> +-              // We are finished.
> +-              if !need_more_tokens {
> +-                      break
> +-              }
> +               // Fetch the next token.
> +               if !yaml_parser_fetch_next_token(parser) {
> +                       return false
> +@@ -678,11 +665,6 @@ func yaml_parser_fetch_next_token(parser *yaml_par=
ser_t) bool {
> +               return false
> +       }
> +
> +-      // Remove obsolete potential simple keys.
> +-      if !yaml_parser_stale_simple_keys(parser) {
> +-              return false
> +-      }
> +-
> +       // Check the indentation level against the current column.
> +       if !yaml_parser_unroll_indent(parser, parser.mark.column) {
> +               return false
> +@@ -837,29 +819,30 @@ func yaml_parser_fetch_next_token(parser *yaml_pa=
rser_t) bool {
> +               "found character that cannot start any token")
> + }
> +
> +-// Check the list of potential simple keys and remove the positions th=
at
> +-// cannot contain simple keys anymore.
> +-func yaml_parser_stale_simple_keys(parser *yaml_parser_t) bool {
> +-      // Check for a potential simple key for each flow level.
> +-      for i :=3D range parser.simple_keys {
> +-              simple_key :=3D &parser.simple_keys[i]
> +-
> +-              // The specification requires that a simple key
> +-              //
> +-              //  - is limited to a single line,
> +-              //  - is shorter than 1024 characters.
> +-              if simple_key.possible && (simple_key.mark.line < parser=
.mark.line || simple_key.mark.index+1024 < parser.mark.index) {
> +-
> +-                      // Check if the potential simple key to be remov=
ed is required.
> +-                      if simple_key.required {
> +-                              return yaml_parser_set_scanner_error(par=
ser,
> +-                                      "while scanning a simple key", s=
imple_key.mark,
> +-                                      "could not find expected ':'")
> +-                      }
> +-                      simple_key.possible =3D false
> ++func yaml_simple_key_is_valid(parser *yaml_parser_t, simple_key *yaml_=
simple_key_t) (valid, ok bool) {
> ++      if !simple_key.possible {
> ++              return false, true
> ++      }
> ++
> ++      // The 1.2 specification says:
> ++      //
> ++      //     "If the ? indicator is omitted, parsing needs to see past=
 the
> ++      //     implicit key to recognize it as such. To limit the amount=
 of
> ++      //     lookahead required, the =E2=80=9C:=E2=80=9D indicator mus=
t appear at most 1024
> ++      //     Unicode characters beyond the start of the key. In additi=
on, the key
> ++      //     is restricted to a single line."
> ++      //
> ++      if simple_key.mark.line < parser.mark.line || simple_key.mark.in=
dex+1024 < parser.mark.index {
> ++              // Check if the potential simple key to be removed is re=
quired.
> ++              if simple_key.required {
> ++                      return false, yaml_parser_set_scanner_error(pars=
er,
> ++                              "while scanning a simple key", simple_ke=
y.mark,
> ++                              "could not find expected ':'")
> +               }
> ++              simple_key.possible =3D false
> ++              return false, true
> +       }
> +-      return true
> ++      return true, true
> + }
> +
> + // Check if a simple key may start at the current position and add it =
if
> +@@ -879,13 +862,14 @@ func yaml_parser_save_simple_key(parser *yaml_par=
ser_t) bool {
> +                       possible:     true,
> +                       required:     required,
> +                       token_number: parser.tokens_parsed + (len(parser=
.tokens) - parser.tokens_head),
> ++                      mark:         parser.mark,
> +               }
> +-              simple_key.mark =3D parser.mark
> +
> +               if !yaml_parser_remove_simple_key(parser) {
> +                       return false
> +               }
> +               parser.simple_keys[len(parser.simple_keys)-1] =3D simple=
_key
> ++              parser.simple_keys_by_tok[simple_key.token_number] =3D l=
en(parser.simple_keys) - 1
> +       }
> +       return true
> + }
> +@@ -900,9 +884,10 @@ func yaml_parser_remove_simple_key(parser *yaml_pa=
rser_t) bool {
> +                               "while scanning a simple key", parser.si=
mple_keys[i].mark,
> +                               "could not find expected ':'")
> +               }
> ++              // Remove the key from the stack.
> ++              parser.simple_keys[i].possible =3D false
> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[i].=
token_number)
> +       }
> +-      // Remove the key from the stack.
> +-      parser.simple_keys[i].possible =3D false
> +       return true
> + }
> +
> +@@ -912,7 +897,12 @@ const max_flow_level =3D 10000
> + // Increase the flow level and resize the simple key list if needed.
> + func yaml_parser_increase_flow_level(parser *yaml_parser_t) bool {
> +       // Reset the simple key on the next level.
> +-      parser.simple_keys =3D append(parser.simple_keys, yaml_simple_ke=
y_t{})
> ++      parser.simple_keys =3D append(parser.simple_keys, yaml_simple_ke=
y_t{
> ++              possible:     false,
> ++              required:     false,
> ++              token_number: parser.tokens_parsed + (len(parser.tokens)=
 - parser.tokens_head),
> ++              mark:         parser.mark,
> ++      })
> +
> +       // Increase the flow level.
> +       parser.flow_level++
> +@@ -928,7 +918,9 @@ func yaml_parser_increase_flow_level(parser *yaml_p=
arser_t) bool {
> + func yaml_parser_decrease_flow_level(parser *yaml_parser_t) bool {
> +       if parser.flow_level > 0 {
> +               parser.flow_level--
> +-              parser.simple_keys =3D parser.simple_keys[:len(parser.si=
mple_keys)-1]
> ++              last :=3D len(parser.simple_keys) - 1
> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[las=
t].token_number)
> ++              parser.simple_keys =3D parser.simple_keys[:last]
> +       }
> +       return true
> + }
> +@@ -1005,6 +997,8 @@ func yaml_parser_fetch_stream_start(parser *yaml_p=
arser_t) bool {
> +       // Initialize the simple key stack.
> +       parser.simple_keys =3D append(parser.simple_keys, yaml_simple_ke=
y_t{})
> +
> ++      parser.simple_keys_by_tok =3D make(map[int]int)
> ++
> +       // A simple key is allowed at the beginning of the stream.
> +       parser.simple_key_allowed =3D true
> +
> +@@ -1286,7 +1280,11 @@ func yaml_parser_fetch_value(parser *yaml_parser=
_t) bool {
> +       simple_key :=3D &parser.simple_keys[len(parser.simple_keys)-1]
> +
> +       // Have we found a simple key?
> +-      if simple_key.possible {
> ++      if valid, ok :=3D yaml_simple_key_is_valid(parser, simple_key); =
!ok {
> ++              return false
> ++
> ++      } else if valid {
> ++
> +               // Create the KEY token and insert it into the queue.
> +               token :=3D yaml_token_t{
> +                       typ:        yaml_KEY_TOKEN,
> +@@ -1304,6 +1302,7 @@ func yaml_parser_fetch_value(parser *yaml_parser_=
t) bool {
> +
> +               // Remove the simple key.
> +               simple_key.possible =3D false
> ++              delete(parser.simple_keys_by_tok, simple_key.token_numbe=
r)
> +
> +               // A simple key cannot follow another simple key.
> +               parser.simple_key_allowed =3D false
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yaml.go b/src/importven=
dor/gopkg.in/yaml.v2/yaml.go
> +index de85aa4cdb7..89650e293ac 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/yaml.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yaml.go
> +@@ -89,7 +89,7 @@ func UnmarshalStrict(in []byte, out interface{}) (err=
 error) {
> +       return unmarshal(in, out, true)
> + }
> +
> +-// A Decorder reads and decodes YAML values from an input stream.
> ++// A Decoder reads and decodes YAML values from an input stream.
> + type Decoder struct {
> +       strict bool
> +       parser *parser
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go b/src/importve=
ndor/gopkg.in/yaml.v2/yamlh.go
> +index e25cee563be..f6a9c8e34b1 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
> +@@ -579,6 +579,7 @@ type yaml_parser_t struct {
> +
> +       simple_key_allowed bool                // May a simple key occur=
 at the current position?
> +       simple_keys        []yaml_simple_key_t // The stack of simple ke=
ys.
> ++      simple_keys_by_tok map[int]int         // possible simple_key in=
dexes indexed by token_number
> +
> +       // Parser stuff
> +
> +diff --git a/src/import/vendor/modules.txt b/src/importvendor/modules.t=
xt
> +index a51796d1ed5..a45f1cd3e3b 100644
> +--- a/src/import/vendor/modules.txt
> ++++ b/src/import/vendor/modules.txt
> +@@ -1059,7 +1059,7 @@ gopkg.in/square/go-jose.v2/jwt
> + gopkg.in/tomb.v1
> + # gopkg.in/warnings.v0 v0.1.1 =3D> gopkg.in/warnings.v0 v0.1.1
> + gopkg.in/warnings.v0
> +-# gopkg.in/yaml.v2 v2.2.4 =3D> gopkg.in/yaml.v2 v2.2.4
> ++# gopkg.in/yaml.v2 v2.2.8 =3D> gopkg.in/yaml.v2 v2.2.8
> + gopkg.in/yaml.v2
> + # gotest.tools v2.2.0+incompatible =3D> gotest.tools v2.2.0+incompatib=
le
> + gotest.tools
> +--
> +2.20.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-c=
ontainers/kubernetes/kubernetes_git.bb
> index 76107af..4698874 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -11,6 +11,11 @@ SRCREV_kubernetes =3D "f45fc1861acab22eb6a4697e3fb831=
e85ef5ff9c"
>  SRC_URI =3D "git://github.com/kubernetes/kubernetes.git;branch=3Dreleas=
e-1.17;name=3Dkubernetes \
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch=
 \
>             file://0001-cross-don-t-build-tests-by-default.patch \
> +           file://0001-Add-new-endpoint-for-resource-metrics.patch \
> +           file://0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch \
> +           file://0001-remove-client-label-from-apiserver-request-count=
-met.patch \
> +           file://0001-Add-code-to-fix-kubelet-metrics-memory-issue.pat=
ch \
> +           file://0001-Deal-with-auto-generated-files.patch \
>            "
>
>  DEPENDS +=3D "rsync-native \
> --
> 2.24.1
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
