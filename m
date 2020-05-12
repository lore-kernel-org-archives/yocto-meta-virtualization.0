Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.4517.1589286236236794560
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 May 2020 05:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZcLF+o0;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id e10so4203690edq.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 May 2020 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgPa2BchiU27OEqTe13bPwMqnWKpNUV9S6IuldNysrw=;
        b=UZcLF+o0xvZlAJuwFxsa6o+BJrJXaAfCEPyxfeaTmOsy+8MzfgUzjrvAY4Ftph04Cb
         O5oTOCAv/gVnhJnSsvdpn+zjlkeeS5K90Zt8gxK/idfZ5Dwa8qhNT3JDDpsnfaRR8uQQ
         AZdppiYj8P1dARjxKzHaoPDg4QFVh8gMoSwPCO+OrHn/x9N3vvZPbFotjS4vAXsTwd6J
         75AnFjM9cHba2NmfLNrWr4ynH5AW1ZlTj19dOoTrw+/TXGZUSTPauHlDtE8KRv8nVjry
         Y19WIXtnMcN3kt9/ycbo1sxynhQuAiIYi94YrmRUediNBCKOsBoKSZMDldDcpbU/ni0c
         xwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgPa2BchiU27OEqTe13bPwMqnWKpNUV9S6IuldNysrw=;
        b=ERoOZuukIWNt6hUPfpGBu76PYzUbIAArb0VAhE9sNmGAwHhPhaK1r9Q9HrUd8B5/1Z
         qcauipSaYNqh71CLwEdv1MUWTomItzosvU9qtk/4yD30S0T43bxtKDUTsBVfbemrgX6G
         wA434xplUEs1EMK/up1cHXOMTcnTFeC81XbUPjVLXOQwgF9VPLHsLEcB8bXPPKoEetKA
         l1YKbpBxlSSPT/vbBoID9/WCKf1LCig/MgYLEflU9UT2VjVrfKAUYhsafWJULmbSDy25
         vnSXwW045Gk7fcsCaPyF493fC7MAovl2c/1N3O8G5SSgwf1igZOfkwJ7AsU6L0KjiroN
         ocuw==
X-Gm-Message-State: AGi0PuYFcCyG+dlQdFoqoxs93pZ9jKtOTfF1HGV0ejsfRKFrEweSoyQM
	vqP8g3AQfnkij2Gxs0btrQsZKvdFt9xgXEMDB9g=
X-Google-Smtp-Source: APiQypI1T9pR2TRNUSR+V64dRTJ9MrvNofCjzYp/krLIIlqXpNkpAubqSGE8d27Mlo3ylVDFErfqW57OnrcDU4i31T4=
X-Received: by 2002:aa7:d9d8:: with SMTP id v24mr17059930eds.27.1589286234389;
 Tue, 12 May 2020 05:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200512085232.72315-1-zhixiong.chi@windriver.com>
In-Reply-To: <20200512085232.72315-1-zhixiong.chi@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 12 May 2020 08:23:43 -0400
Message-ID: <CADkTA4OP8-pLQu1KO9rv-9Ld7fdyepPYuYhvCed8AnU_piJgOg@mail.gmail.com>
Subject: Re: [meta-virtualization][zeus][PATCH] kubernetes: CVE-2020-8551 and CVE-2020-8552
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

As mentioned previously (check the archives) I'm about to go to
1.18-release so I won't be backporting any k8s CVE patches.

If these are for a stable branch, indicate that clearly in the patch subject.

Bruce

On Tue, May 12, 2020 at 4:52 AM Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>
> Backport the CVE patches from the upstream:
> https://github.com/kubernetes/kubernetes.git
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../kubernetes/kubernetes/CVE-2020-8551.patch | 303 ++++++++++++++++++
>  .../kubernetes/kubernetes/CVE-2020-8552.patch | 170 ++++++++++
>  .../kubernetes/kubernetes_git.bb              |   2 +
>  3 files changed, 475 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch
> new file mode 100644
> index 0000000..f1f87b0
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch
> @@ -0,0 +1,303 @@
> +From 9bae583cb0c46380866c3df5d7a6d26aac335818 Mon Sep 17 00:00:00 2001
> +From: Walter Fender <wfender@google.com>
> +Date: Thu, 6 Feb 2020 19:10:18 -0800
> +Subject: [PATCH] Add code to fix kubelet/metrics memory issue.
> +
> +Bucketing url paths based on concept/handling.
> +Bucketing code placed by handling code to encourage usage.
> +Added unit tests.
> +Fix format.
> +
> +CVE: CVE-2020-8551
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + pkg/kubelet/server/server.go      | 56 ++++++++++++++++++++++++++++---
> + pkg/kubelet/server/server_test.go | 54 ++++++++++++++++++++++++++++-
> + 2 files changed, 105 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/kubelet/server/server.go
> +index c1f1975fe43..f924304fc12 100644
> +--- a/src/import/pkg/kubelet/server/server.go
> ++++ b/src/import/pkg/kubelet/server/server.go
> +@@ -90,6 +90,7 @@ type Server struct {
> +       auth                       AuthInterface
> +       host                       HostInterface
> +       restfulCont                containerInterface
> ++      metricsBuckets             map[string]bool
> +       resourceAnalyzer           stats.ResourceAnalyzer
> +       redirectContainerStreaming bool
> + }
> +@@ -224,6 +225,7 @@ func NewServer(
> +               resourceAnalyzer:           resourceAnalyzer,
> +               auth:                       auth,
> +               restfulCont:                &filteringContainer{Container: restful.NewContainer()},
> ++              metricsBuckets:             make(map[string]bool),
> +               redirectContainerStreaming: redirectContainerStreaming,
> +       }
> +       if auth != nil {
> +@@ -279,14 +281,32 @@ func (s *Server) InstallAuthFilter() {
> +       })
> + }
> +
> ++// addMetricsBucketMatcher adds a regexp matcher and the relevant bucket to use when
> ++// it matches. Please be aware this is not thread safe and should not be used dynamically
> ++func (s *Server) addMetricsBucketMatcher(bucket string) {
> ++      s.metricsBuckets[bucket] = true
> ++}
> ++
> ++// getMetricBucket find the appropriate metrics reporting bucket for the given path
> ++func (s *Server) getMetricBucket(path string) string {
> ++      root := getURLRootPath(path)
> ++      if s.metricsBuckets[root] == true {
> ++              return root
> ++      }
> ++      return "Invalid path"
> ++}
> ++
> + // InstallDefaultHandlers registers the default set of supported HTTP request
> + // patterns with the restful Container.
> + func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
> ++      s.addMetricsBucketMatcher("healthz")
> +       healthz.InstallHandler(s.restfulCont,
> +               healthz.PingHealthz,
> +               healthz.LogHealthz,
> +               healthz.NamedCheck("syncloop", s.syncLoopHealthCheck),
> +       )
> ++
> ++      s.addMetricsBucketMatcher("pods")
> +       ws := new(restful.WebService)
> +       ws.
> +               Path("/pods").
> +@@ -296,7 +316,14 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
> +               Operation("getPods"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("stats")
> +       s.restfulCont.Add(stats.CreateHandlers(statsPath, s.host, s.resourceAnalyzer, enableCAdvisorJSONEndpoints))
> ++
> ++      s.addMetricsBucketMatcher("metrics")
> ++      s.addMetricsBucketMatcher("metrics/cadvisor")
> ++      s.addMetricsBucketMatcher("metrics/probes")
> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> ++      s.addMetricsBucketMatcher("metrics/resource")
> +       //lint:ignore SA1019 https://github.com/kubernetes/enhancements/issues/1206
> +       s.restfulCont.Handle(metricsPath, legacyregistry.Handler())
> +
> +@@ -316,6 +346,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
> +               promhttp.HandlerFor(r, promhttp.HandlerOpts{ErrorHandling: promhttp.ContinueOnError}),
> +       )
> +
> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> +       v1alpha1ResourceRegistry := prometheus.NewRegistry()
> +       v1alpha1ResourceRegistry.MustRegister(stats.NewPrometheusResourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
> +       s.restfulCont.Handle(path.Join(resourceMetricsPathPrefix, v1alpha1.Version),
> +@@ -325,11 +357,14 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
> +
> +       p := compbasemetrics.NewKubeRegistry()
> +       compbasemetrics.RegisterProcessStartTime(p.RawRegister)
> ++
> ++      s.addMetricsBucketMatcher("metrics/probes")
> +       p.MustRegister(prober.ProberResults)
> +       s.restfulCont.Handle(proberMetricsPath,
> +               promhttp.HandlerFor(p, promhttp.HandlerOpts{ErrorHandling: promhttp.ContinueOnError}),
> +       )
> +
> ++      s.addMetricsBucketMatcher("spec")
> +       if enableCAdvisorJSONEndpoints {
> +               ws := new(restful.WebService)
> +               ws.
> +@@ -349,6 +384,7 @@ const pprofBasePath = "/debug/pprof/"
> + func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +       klog.Infof("Adding debug handlers to kubelet server.")
> +
> ++      s.addMetricsBucketMatcher("run")
> +       ws := new(restful.WebService)
> +       ws.
> +               Path("/run")
> +@@ -360,6 +396,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getRun"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("exec")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path("/exec")
> +@@ -377,6 +414,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getExec"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("attach")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path("/attach")
> +@@ -394,6 +432,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getAttach"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("portForward")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path("/portForward")
> +@@ -411,6 +450,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getPortForward"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("logs")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path(logsPath)
> +@@ -423,6 +463,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Param(ws.PathParameter("logpath", "path to the log").DataType("string")))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("containerLogs")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path("/containerLogs")
> +@@ -431,8 +472,10 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getContainerLogs"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("configz")
> +       configz.InstallHandler(s.restfulCont)
> +
> ++      s.addMetricsBucketMatcher("debug")
> +       handlePprofEndpoint := func(req *restful.Request, resp *restful.Response) {
> +               name := strings.TrimPrefix(req.Request.URL.Path, pprofBasePath)
> +               switch name {
> +@@ -448,7 +491,6 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +                       pprof.Index(resp, req.Request)
> +               }
> +       }
> +-
> +       // Setup pprof handlers.
> +       ws = new(restful.WebService).Path(pprofBasePath)
> +       ws.Route(ws.GET("/{subpath:*}").To(func(req *restful.Request, resp *restful.Response) {
> +@@ -461,6 +503,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +       s.restfulCont.Handle("/debug/flags/v", routes.StringFlagPutHandler(logs.GlogSetter))
> +
> +       // The /runningpods endpoint is used for testing only.
> ++      s.addMetricsBucketMatcher("runningpods")
> +       ws = new(restful.WebService)
> +       ws.
> +               Path("/runningpods/").
> +@@ -470,6 +513,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> +               Operation("getRunningPods"))
> +       s.restfulCont.Add(ws)
> +
> ++      s.addMetricsBucketMatcher("cri")
> +       if criHandler != nil {
> +               s.restfulCont.Handle("/cri/", criHandler)
> +       }
> +@@ -481,6 +525,14 @@ func (s *Server) InstallDebuggingDisabledHandlers() {
> +               http.Error(w, "Debug endpoints are disabled.", http.StatusMethodNotAllowed)
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
> +       paths := []string{
> +               "/run/", "/exec/", "/attach/", "/portForward/", "/containerLogs/",
> +               "/runningpods/", pprofBasePath, logsPath}
> +@@ -814,10 +849,10 @@ func (s *Server) getPortForward(request *restful.Request, response *restful.Resp
> +       proxyStream(response.ResponseWriter, request.Request, url)
> + }
> +
> +-// trimURLPath trims a URL path.
> ++// getURLRootPath trims a URL path.
> + // For paths in the format of "/metrics/xxx", "metrics/xxx" is returned;
> + // For all other paths, the first part of the path is returned.
> +-func trimURLPath(path string) string {
> ++func getURLRootPath(path string) string {
> +       parts := strings.SplitN(strings.TrimPrefix(path, "/"), "/", 3)
> +       if len(parts) == 0 {
> +               return path
> +@@ -865,7 +900,7 @@ func (s *Server) ServeHTTP(w http.ResponseWriter, req *http.Request) {
> +               serverType = "readwrite"
> +       }
> +
> +-      method, path := req.Method, trimURLPath(req.URL.Path)
> ++      method, path := req.Method, s.getMetricBucket(req.URL.Path)
> +
> +       longRunning := strconv.FormatBool(isLongRunningRequest(path))
> +
> +diff --git a/src/import/pkg/kubelet/server/server_test.go b/src/import/pkg/kubelet/server/server_test.go
> +index 4761d21afb7..a95e5d19f0b 100644
> +--- a/src/import/pkg/kubelet/server/server_test.go
> ++++ b/src/import/pkg/kubelet/server/server_test.go
> +@@ -1612,6 +1612,58 @@ func TestCRIHandler(t *testing.T) {
> +       assert.Equal(t, query, fw.criHandler.RequestReceived.URL.RawQuery)
> + }
> +
> ++func TestMetricBuckets(t *testing.T) {
> ++      tests := map[string]struct {
> ++              url    string
> ++              bucket string
> ++      }{
> ++              "healthz endpoint":                {url: "/healthz", bucket: "healthz"},
> ++              "attach":                          {url: "/attach/podNamespace/podID/containerName", bucket: "attach"},
> ++              "attach with uid":                 {url: "/attach/podNamespace/podID/uid/containerName", bucket: "attach"},
> ++              "configz":                         {url: "/configz", bucket: "configz"},
> ++              "containerLogs":                   {url: "/containerLogs/podNamespace/podID/containerName", bucket: "containerLogs"},
> ++              "cri":                             {url: "/cri/", bucket: "cri"},
> ++              "cri with sub":                    {url: "/cri/foo", bucket: "cri"},
> ++              "debug v flags":                   {url: "/debug/flags/v", bucket: "debug"},
> ++              "pprof with sub":                  {url: "/debug/pprof/subpath", bucket: "debug"},
> ++              "exec":                            {url: "/exec/podNamespace/podID/containerName", bucket: "exec"},
> ++              "exec with uid":                   {url: "/exec/podNamespace/podID/uid/containerName", bucket: "exec"},
> ++              "healthz":                         {url: "/healthz/", bucket: "healthz"},
> ++              "healthz log sub":                 {url: "/healthz/log", bucket: "healthz"},
> ++              "healthz ping":                    {url: "/healthz/ping", bucket: "healthz"},
> ++              "healthz sync loop":               {url: "/healthz/syncloop", bucket: "healthz"},
> ++              "logs":                            {url: "/logs/", bucket: "logs"},
> ++              "logs with path":                  {url: "/logs/logpath", bucket: "logs"},
> ++              "metrics":                         {url: "/metrics", bucket: "metrics"},
> ++              "metrics cadvisor sub":            {url: "/metrics/cadvisor", bucket: "metrics/cadvisor"},
> ++              "metrics probes sub":              {url: "/metrics/probes", bucket: "metrics/probes"},
> ++              "metrics resource v1alpha1":       {url: "/metrics/resource/v1alpha1", bucket: "metrics/resource"},
> ++              "metrics resource sub":            {url: "/metrics/resource", bucket: "metrics/resource"},
> ++              "pods":                            {url: "/pods/", bucket: "pods"},
> ++              "portForward":                     {url: "/portForward/podNamespace/podID", bucket: "portForward"},
> ++              "portForward with uid":            {url: "/portForward/podNamespace/podID/uid", bucket: "portForward"},
> ++              "run":                             {url: "/run/podNamespace/podID/containerName", bucket: "run"},
> ++              "run with uid":                    {url: "/run/podNamespace/podID/uid/containerName", bucket: "run"},
> ++              "runningpods":                     {url: "/runningpods/", bucket: "runningpods"},
> ++              "spec":                            {url: "/spec/", bucket: "spec"},
> ++              "stats":                           {url: "/stats/", bucket: "stats"},
> ++              "stats container sub":             {url: "/stats/container", bucket: "stats"},
> ++              "stats summary sub":               {url: "/stats/summary", bucket: "stats"},
> ++              "stats containerName with uid":    {url: "/stats/namespace/podName/uid/containerName", bucket: "stats"},
> ++              "stats containerName":             {url: "/stats/podName/containerName", bucket: "stats"},
> ++              "invalid path":                    {url: "/junk", bucket: "Invalid path"},
> ++              "invalid path starting with good": {url: "/healthzjunk", bucket: "Invalid path"},
> ++      }
> ++      fw := newServerTest()
> ++      defer fw.testHTTPServer.Close()
> ++
> ++      for _, test := range tests {
> ++              path := test.url
> ++              bucket := test.bucket
> ++              require.Equal(t, fw.serverUnderTest.getMetricBucket(path), bucket)
> ++      }
> ++}
> ++
> + func TestDebuggingDisabledHandlers(t *testing.T) {
> +       fw := newServerTestWithDebug(false, false, nil)
> +       defer fw.testHTTPServer.Close()
> +@@ -1685,6 +1737,6 @@ func TestTrimURLPath(t *testing.T) {
> +       }
> +
> +       for _, test := range tests {
> +-              assert.Equal(t, test.expected, trimURLPath(test.path), fmt.Sprintf("path is: %s", test.path))
> ++              assert.Equal(t, test.expected, getURLRootPath(test.path), fmt.Sprintf("path is: %s", test.path))
> +       }
> + }
> +--
> +2.17.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch
> new file mode 100644
> index 0000000..85d7fcb
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch
> @@ -0,0 +1,170 @@
> +From cc3190968b1f14ddf4067abef849fc41bd6068dc Mon Sep 17 00:00:00 2001
> +From: Han Kang <hankang@google.com>
> +Date: Wed, 29 Jan 2020 12:25:55 -0800
> +Subject: [PATCH] remove client label from apiserver request count metric since
> + it is unbounded
> +
> +Change-Id: I3a9eacebc9d9dc9ed6347260d9378cdcb5743431
> +
> +CVE: CVE-2020-8552
> +Upstream-Status: Backport [Cherry-picked from https://github.com/kubernetes/kubernetes.git tag:v1.18.0]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + .../apiserver/pkg/endpoints/metrics/BUILD     |  8 ---
> + .../pkg/endpoints/metrics/metrics.go          | 21 ++------
> + .../pkg/endpoints/metrics/metrics_test.go     | 54 -------------------
> + 3 files changed, 3 insertions(+), 80 deletions(-)
> + delete mode 100644 staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
> +
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
> +index 8d13a34eadc..8abb3d1a611 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
> +@@ -3,13 +3,6 @@ package(default_visibility = ["//visibility:public"])
> + load(
> +     "@io_bazel_rules_go//go:def.bzl",
> +     "go_library",
> +-    "go_test",
> +-)
> +-
> +-go_test(
> +-    name = "go_default_test",
> +-    srcs = ["metrics_test.go"],
> +-    embed = [":go_default_library"],
> + )
> +
> + go_library(
> +@@ -20,7 +13,6 @@ go_library(
> +     deps = [
> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1/validation:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/types:go_default_library",
> +-        "//staging/src/k8s.io/apimachinery/pkg/util/net:go_default_library",
> +         "//staging/src/k8s.io/apimachinery/pkg/util/sets:go_default_library",
> +         "//staging/src/k8s.io/apiserver/pkg/endpoints/request:go_default_library",
> +         "//staging/src/k8s.io/apiserver/pkg/features:go_default_library",
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
> +index f4e02fbb6a8..c79efdef4e3 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
> +@@ -29,7 +29,6 @@ import (
> +
> +       "k8s.io/apimachinery/pkg/apis/meta/v1/validation"
> +       "k8s.io/apimachinery/pkg/types"
> +-      utilnet "k8s.io/apimachinery/pkg/util/net"
> +       utilsets "k8s.io/apimachinery/pkg/util/sets"
> +       "k8s.io/apiserver/pkg/endpoints/request"
> +       "k8s.io/apiserver/pkg/features"
> +@@ -66,14 +65,14 @@ var (
> +       requestCounter = compbasemetrics.NewCounterVec(
> +               &compbasemetrics.CounterOpts{
> +                       Name:           "apiserver_request_total",
> +-                      Help:           "Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, client, and HTTP response contentType and code.",
> ++                      Help:           "Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, and HTTP response contentType and code.",
> +                       StabilityLevel: compbasemetrics.ALPHA,
> +               },
> +               // The label_name contentType doesn't follow the label_name convention defined here:
> +               // https://github.com/kubernetes/community/blob/master/contributors/devel/sig-instrumentation/instrumentation.md
> +               // But changing it would break backwards compatibility. Future label_names
> +               // should be all lowercase and separated by underscores.
> +-              []string{"verb", "dry_run", "group", "version", "resource", "subresource", "scope", "component", "client", "contentType", "code"},
> ++              []string{"verb", "dry_run", "group", "version", "resource", "subresource", "scope", "component", "contentType", "code"},
> +       )
> +       deprecatedRequestCounter = compbasemetrics.NewCounterVec(
> +               &compbasemetrics.CounterOpts{
> +@@ -243,11 +242,10 @@ func RecordLongRunning(req *http.Request, requestInfo *request.RequestInfo, comp
> + func MonitorRequest(req *http.Request, verb, group, version, resource, subresource, scope, component, contentType string, httpCode, respSize int, elapsed time.Duration) {
> +       reportedVerb := cleanVerb(verb, req)
> +       dryRun := cleanDryRun(req.URL)
> +-      client := cleanUserAgent(utilnet.GetHTTPClient(req))
> +       elapsedMicroseconds := float64(elapsed / time.Microsecond)
> +       elapsedSeconds := elapsed.Seconds()
> +-      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
> +-      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
> ++      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
> ++      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
> +       requestLatencies.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component).Observe(elapsedSeconds)
> +       deprecatedRequestLatencies.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
> +       deprecatedRequestLatenciesSummary.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
> +@@ -355,19 +353,6 @@ func cleanDryRun(u *url.URL) string {
> +       return strings.Join(utilsets.NewString(dryRun...).List(), ",")
> + }
> +
> +-func cleanUserAgent(ua string) string {
> +-      // We collapse all "web browser"-type user agents into one "browser" to reduce metric cardinality.
> +-      if strings.HasPrefix(ua, "Mozilla/") {
> +-              return "Browser"
> +-      }
> +-      // If an old "kubectl.exe" has passed us its full path, we discard the path portion.
> +-      if kubectlExeRegexp.MatchString(ua) {
> +-              // avoid an allocation
> +-              ua = kubectlExeRegexp.ReplaceAllString(ua, "$1")
> +-      }
> +-      return ua
> +-}
> +-
> + // ResponseWriterDelegator interface wraps http.ResponseWriter to additionally record content-length, status-code, etc.
> + type ResponseWriterDelegator struct {
> +       http.ResponseWriter
> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
> +deleted file mode 100644
> +index 4c0a8aa5d27..00000000000
> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
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
> +-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> +-See the License for the specific language governing permissions and
> +-limitations under the License.
> +-*/
> +-
> +-package metrics
> +-
> +-import "testing"
> +-
> +-func TestCleanUserAgent(t *testing.T) {
> +-      panicBuf := []byte{198, 73, 129, 133, 90, 216, 104, 29, 13, 134, 209, 233, 30, 0, 22}
> +-
> +-      for _, tc := range []struct {
> +-              In  string
> +-              Out string
> +-      }{
> +-              {
> +-                      In:  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36",
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
> +-              if cleanUserAgent(tc.In) != tc.Out {
> +-                      t.Errorf("Failed to clean User-Agent: %s", tc.In)
> +-              }
> +-      }
> +-}
> +--
> +2.17.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index fae554d..c378ccc 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -12,6 +12,8 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.16;name=k
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
>             file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
> +           file://CVE-2020-8551.patch \
> +           file://CVE-2020-8552.patch \
>            "
>
>  DEPENDS += "rsync-native \
> --
> 2.23.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
