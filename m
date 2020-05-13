Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.2390.1589335449003576375
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 May 2020 19:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W/x+kyi/;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e2so12794988eje.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 May 2020 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KuzQyXTzYR3J6+l50KcYe2EGhgBNi01P2cCYsAKl25U=;
        b=W/x+kyi/4mtmYaqNDs8mn7OrB1aE1blVkhyKDZn43bxhgbDJHRrEfOpYQpT9Y9lWY+
         +fZCd3GE9tcV0SXtHxRsyXuTjuOg+I73SZweUIBjaG7mCaRfMwdEP2iZqtaRHYp1d5mE
         szJQaONdjJnJC4wEEoLNq1RMqIUAvj11RSGdNJ7OvrESKliA/YREDSuOt5gpA3sBPgQc
         DInrt7N/jLAkFh6UnmxZk48oxAdMi8+9vbBgLZ7gUVLkGN0+EJdPxIZIBoYqpePuYn7O
         M9QO3O1BhtFFfcZ4J20xzFHJ6GvFkjnR+w5JFoXY9mzZVvhxAD+dZ8Wwrn4nAcoN1pn2
         YSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KuzQyXTzYR3J6+l50KcYe2EGhgBNi01P2cCYsAKl25U=;
        b=OV6kf/j36DGBk8SzB7blE1MQukT3ZHIKnYG5N5iR7vNMYq/Rddg4X/ct7YhEXHCD6J
         nG5OKDlk7758Iv8WtfFFvrUw7/TDB0sX2f+GClzuLGOr1Vb4rkJuNue2O10tGfKFXQ+d
         oaRqsk5gLioIyJpwtvn4JxE6/rpCvU95Ny+VR/7XPmvfi/EvtQiD/gFjN9tymRKhHZu4
         rPMDlK1DAMqD8JHg2COPAtl0c8b3TOCE25g82G93oyEn4w6SF80+6Kec5BpmDfDedAzq
         y8rXt8+anu//6OZiPVO11ZnNxyjltToT2tsRUqWwSq3PzGE3o2wUfqrzRLc6zDpjZaNj
         TrMg==
X-Gm-Message-State: AGi0PuYlDslCK0Z+o3IfCvNQQ201W2t0S40cPwUqWbbSOVFt2endHOnF
	iaq28otw+SVqVL6iuB65btTMRAGu/G57ChhFXnQ=
X-Google-Smtp-Source: APiQypJRGzBnrkVrEizYBI8s0MGhCOaeFKNGCor68dNd/ZHZLg7AAyGxi48uTXU5KcHKDKCo/U4EPsWNqwTyoAxbfy8=
X-Received: by 2002:a17:906:25cb:: with SMTP id n11mr21201412ejb.37.1589335447292;
 Tue, 12 May 2020 19:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200512085232.72315-1-zhixiong.chi@windriver.com>
 <CADkTA4OP8-pLQu1KO9rv-9Ld7fdyepPYuYhvCed8AnU_piJgOg@mail.gmail.com> <8d477377-0ec5-8414-09ab-8b0541e340b2@windriver.com>
In-Reply-To: <8d477377-0ec5-8414-09ab-8b0541e340b2@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 12 May 2020 22:03:55 -0400
Message-ID: <CADkTA4P_jqpYY7Ca0oPNjcsWG7DWjy7raMmLhSsAJyhL0KpCHQ@mail.gmail.com>
Subject: Re: [meta-virtualization][zeus][PATCH] kubernetes: CVE-2020-8551 and CVE-2020-8552
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 10:00 PM Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
>
> Hi Bruce,
>
> The zeus branch will also be rebased to 1.18-release, right?
>

I was considering it.

but now that you've replied, I can see that you tagged this as Zeus
and gmail hid that from me in the original listing (since I get all
these mail twice on the new lists, it threaded them).

I can merge this to Zeus and will consider 1.18 after.

Bruce

> Thanks,
>
>
> On 2020=E5=B9=B405=E6=9C=8812=E6=97=A5 20:23, Bruce Ashfield wrote:
> > As mentioned previously (check the archives) I'm about to go to
> > 1.18-release so I won't be backporting any k8s CVE patches.
> >
> > If these are for a stable branch, indicate that clearly in the patch su=
bject.
> >
> > Bruce
> >
> > On Tue, May 12, 2020 at 4:52 AM Zhixiong Chi <zhixiong.chi@windriver.co=
m> wrote:
> >> Backport the CVE patches from the upstream:
> >> https://github.com/kubernetes/kubernetes.git
> >>
> >> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> >> ---
> >>   .../kubernetes/kubernetes/CVE-2020-8551.patch | 303 ++++++++++++++++=
++
> >>   .../kubernetes/kubernetes/CVE-2020-8552.patch | 170 ++++++++++
> >>   .../kubernetes/kubernetes_git.bb              |   2 +
> >>   3 files changed, 475 insertions(+)
> >>   create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020=
-8551.patch
> >>   create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020=
-8552.patch
> >>
> >> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.pa=
tch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch
> >> new file mode 100644
> >> index 0000000..f1f87b0
> >> --- /dev/null
> >> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8551.patch
> >> @@ -0,0 +1,303 @@
> >> +From 9bae583cb0c46380866c3df5d7a6d26aac335818 Mon Sep 17 00:00:00 200=
1
> >> +From: Walter Fender <wfender@google.com>
> >> +Date: Thu, 6 Feb 2020 19:10:18 -0800
> >> +Subject: [PATCH] Add code to fix kubelet/metrics memory issue.
> >> +
> >> +Bucketing url paths based on concept/handling.
> >> +Bucketing code placed by handling code to encourage usage.
> >> +Added unit tests.
> >> +Fix format.
> >> +
> >> +CVE: CVE-2020-8551
> >> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.g=
it]
> >> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> >> +---
> >> + pkg/kubelet/server/server.go      | 56 ++++++++++++++++++++++++++++-=
--
> >> + pkg/kubelet/server/server_test.go | 54 ++++++++++++++++++++++++++++-
> >> + 2 files changed, 105 insertions(+), 5 deletions(-)
> >> +
> >> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg=
/kubelet/server/server.go
> >> +index c1f1975fe43..f924304fc12 100644
> >> +--- a/src/import/pkg/kubelet/server/server.go
> >> ++++ b/src/import/pkg/kubelet/server/server.go
> >> +@@ -90,6 +90,7 @@ type Server struct {
> >> +       auth                       AuthInterface
> >> +       host                       HostInterface
> >> +       restfulCont                containerInterface
> >> ++      metricsBuckets             map[string]bool
> >> +       resourceAnalyzer           stats.ResourceAnalyzer
> >> +       redirectContainerStreaming bool
> >> + }
> >> +@@ -224,6 +225,7 @@ func NewServer(
> >> +               resourceAnalyzer:           resourceAnalyzer,
> >> +               auth:                       auth,
> >> +               restfulCont:                &filteringContainer{Contai=
ner: restful.NewContainer()},
> >> ++              metricsBuckets:             make(map[string]bool),
> >> +               redirectContainerStreaming: redirectContainerStreaming=
,
> >> +       }
> >> +       if auth !=3D nil {
> >> +@@ -279,14 +281,32 @@ func (s *Server) InstallAuthFilter() {
> >> +       })
> >> + }
> >> +
> >> ++// addMetricsBucketMatcher adds a regexp matcher and the relevant bu=
cket to use when
> >> ++// it matches. Please be aware this is not thread safe and should no=
t be used dynamically
> >> ++func (s *Server) addMetricsBucketMatcher(bucket string) {
> >> ++      s.metricsBuckets[bucket] =3D true
> >> ++}
> >> ++
> >> ++// getMetricBucket find the appropriate metrics reporting bucket for=
 the given path
> >> ++func (s *Server) getMetricBucket(path string) string {
> >> ++      root :=3D getURLRootPath(path)
> >> ++      if s.metricsBuckets[root] =3D=3D true {
> >> ++              return root
> >> ++      }
> >> ++      return "Invalid path"
> >> ++}
> >> ++
> >> + // InstallDefaultHandlers registers the default set of supported HTT=
P request
> >> + // patterns with the restful Container.
> >> + func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints =
bool) {
> >> ++      s.addMetricsBucketMatcher("healthz")
> >> +       healthz.InstallHandler(s.restfulCont,
> >> +               healthz.PingHealthz,
> >> +               healthz.LogHealthz,
> >> +               healthz.NamedCheck("syncloop", s.syncLoopHealthCheck),
> >> +       )
> >> ++
> >> ++      s.addMetricsBucketMatcher("pods")
> >> +       ws :=3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/pods").
> >> +@@ -296,7 +316,14 @@ func (s *Server) InstallDefaultHandlers(enableCA=
dvisorJSONEndpoints bool) {
> >> +               Operation("getPods"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("stats")
> >> +       s.restfulCont.Add(stats.CreateHandlers(statsPath, s.host, s.re=
sourceAnalyzer, enableCAdvisorJSONEndpoints))
> >> ++
> >> ++      s.addMetricsBucketMatcher("metrics")
> >> ++      s.addMetricsBucketMatcher("metrics/cadvisor")
> >> ++      s.addMetricsBucketMatcher("metrics/probes")
> >> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> >> ++      s.addMetricsBucketMatcher("metrics/resource")
> >> +       //lint:ignore SA1019 https://github.com/kubernetes/enhancement=
s/issues/1206
> >> +       s.restfulCont.Handle(metricsPath, legacyregistry.Handler())
> >> +
> >> +@@ -316,6 +346,7 @@ func (s *Server) InstallDefaultHandlers(enableCAd=
visorJSONEndpoints bool) {
> >> +               promhttp.HandlerFor(r, promhttp.HandlerOpts{ErrorHandl=
ing: promhttp.ContinueOnError}),
> >> +       )
> >> +
> >> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
> >> +       v1alpha1ResourceRegistry :=3D prometheus.NewRegistry()
> >> +       v1alpha1ResourceRegistry.MustRegister(stats.NewPrometheusResou=
rceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
> >> +       s.restfulCont.Handle(path.Join(resourceMetricsPathPrefix, v1al=
pha1.Version),
> >> +@@ -325,11 +357,14 @@ func (s *Server) InstallDefaultHandlers(enableC=
AdvisorJSONEndpoints bool) {
> >> +
> >> +       p :=3D compbasemetrics.NewKubeRegistry()
> >> +       compbasemetrics.RegisterProcessStartTime(p.RawRegister)
> >> ++
> >> ++      s.addMetricsBucketMatcher("metrics/probes")
> >> +       p.MustRegister(prober.ProberResults)
> >> +       s.restfulCont.Handle(proberMetricsPath,
> >> +               promhttp.HandlerFor(p, promhttp.HandlerOpts{ErrorHandl=
ing: promhttp.ContinueOnError}),
> >> +       )
> >> +
> >> ++      s.addMetricsBucketMatcher("spec")
> >> +       if enableCAdvisorJSONEndpoints {
> >> +               ws :=3D new(restful.WebService)
> >> +               ws.
> >> +@@ -349,6 +384,7 @@ const pprofBasePath =3D "/debug/pprof/"
> >> + func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
> >> +       klog.Infof("Adding debug handlers to kubelet server.")
> >> +
> >> ++      s.addMetricsBucketMatcher("run")
> >> +       ws :=3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/run")
> >> +@@ -360,6 +396,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Operation("getRun"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("exec")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/exec")
> >> +@@ -377,6 +414,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Operation("getExec"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("attach")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/attach")
> >> +@@ -394,6 +432,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Operation("getAttach"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("portForward")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/portForward")
> >> +@@ -411,6 +450,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Operation("getPortForward"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("logs")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path(logsPath)
> >> +@@ -423,6 +463,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Param(ws.PathParameter("logpath", "path to the log").D=
ataType("string")))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("containerLogs")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/containerLogs")
> >> +@@ -431,8 +472,10 @@ func (s *Server) InstallDebuggingHandlers(criHan=
dler http.Handler) {
> >> +               Operation("getContainerLogs"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("configz")
> >> +       configz.InstallHandler(s.restfulCont)
> >> +
> >> ++      s.addMetricsBucketMatcher("debug")
> >> +       handlePprofEndpoint :=3D func(req *restful.Request, resp *rest=
ful.Response) {
> >> +               name :=3D strings.TrimPrefix(req.Request.URL.Path, ppr=
ofBasePath)
> >> +               switch name {
> >> +@@ -448,7 +491,6 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +                       pprof.Index(resp, req.Request)
> >> +               }
> >> +       }
> >> +-
> >> +       // Setup pprof handlers.
> >> +       ws =3D new(restful.WebService).Path(pprofBasePath)
> >> +       ws.Route(ws.GET("/{subpath:*}").To(func(req *restful.Request, =
resp *restful.Response) {
> >> +@@ -461,6 +503,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +       s.restfulCont.Handle("/debug/flags/v", routes.StringFlagPutHan=
dler(logs.GlogSetter))
> >> +
> >> +       // The /runningpods endpoint is used for testing only.
> >> ++      s.addMetricsBucketMatcher("runningpods")
> >> +       ws =3D new(restful.WebService)
> >> +       ws.
> >> +               Path("/runningpods/").
> >> +@@ -470,6 +513,7 @@ func (s *Server) InstallDebuggingHandlers(criHand=
ler http.Handler) {
> >> +               Operation("getRunningPods"))
> >> +       s.restfulCont.Add(ws)
> >> +
> >> ++      s.addMetricsBucketMatcher("cri")
> >> +       if criHandler !=3D nil {
> >> +               s.restfulCont.Handle("/cri/", criHandler)
> >> +       }
> >> +@@ -481,6 +525,14 @@ func (s *Server) InstallDebuggingDisabledHandler=
s() {
> >> +               http.Error(w, "Debug endpoints are disabled.", http.St=
atusMethodNotAllowed)
> >> +       })
> >> +
> >> ++      s.addMetricsBucketMatcher("run")
> >> ++      s.addMetricsBucketMatcher("exec")
> >> ++      s.addMetricsBucketMatcher("attach")
> >> ++      s.addMetricsBucketMatcher("portForward")
> >> ++      s.addMetricsBucketMatcher("containerLogs")
> >> ++      s.addMetricsBucketMatcher("runningpods")
> >> ++      s.addMetricsBucketMatcher("pprof")
> >> ++      s.addMetricsBucketMatcher("logs")
> >> +       paths :=3D []string{
> >> +               "/run/", "/exec/", "/attach/", "/portForward/", "/cont=
ainerLogs/",
> >> +               "/runningpods/", pprofBasePath, logsPath}
> >> +@@ -814,10 +849,10 @@ func (s *Server) getPortForward(request *restfu=
l.Request, response *restful.Resp
> >> +       proxyStream(response.ResponseWriter, request.Request, url)
> >> + }
> >> +
> >> +-// trimURLPath trims a URL path.
> >> ++// getURLRootPath trims a URL path.
> >> + // For paths in the format of "/metrics/xxx", "metrics/xxx" is retur=
ned;
> >> + // For all other paths, the first part of the path is returned.
> >> +-func trimURLPath(path string) string {
> >> ++func getURLRootPath(path string) string {
> >> +       parts :=3D strings.SplitN(strings.TrimPrefix(path, "/"), "/", =
3)
> >> +       if len(parts) =3D=3D 0 {
> >> +               return path
> >> +@@ -865,7 +900,7 @@ func (s *Server) ServeHTTP(w http.ResponseWriter,=
 req *http.Request) {
> >> +               serverType =3D "readwrite"
> >> +       }
> >> +
> >> +-      method, path :=3D req.Method, trimURLPath(req.URL.Path)
> >> ++      method, path :=3D req.Method, s.getMetricBucket(req.URL.Path)
> >> +
> >> +       longRunning :=3D strconv.FormatBool(isLongRunningRequest(path)=
)
> >> +
> >> +diff --git a/src/import/pkg/kubelet/server/server_test.go b/src/impor=
t/pkg/kubelet/server/server_test.go
> >> +index 4761d21afb7..a95e5d19f0b 100644
> >> +--- a/src/import/pkg/kubelet/server/server_test.go
> >> ++++ b/src/import/pkg/kubelet/server/server_test.go
> >> +@@ -1612,6 +1612,58 @@ func TestCRIHandler(t *testing.T) {
> >> +       assert.Equal(t, query, fw.criHandler.RequestReceived.URL.RawQu=
ery)
> >> + }
> >> +
> >> ++func TestMetricBuckets(t *testing.T) {
> >> ++      tests :=3D map[string]struct {
> >> ++              url    string
> >> ++              bucket string
> >> ++      }{
> >> ++              "healthz endpoint":                {url: "/healthz", b=
ucket: "healthz"},
> >> ++              "attach":                          {url: "/attach/podN=
amespace/podID/containerName", bucket: "attach"},
> >> ++              "attach with uid":                 {url: "/attach/podN=
amespace/podID/uid/containerName", bucket: "attach"},
> >> ++              "configz":                         {url: "/configz", b=
ucket: "configz"},
> >> ++              "containerLogs":                   {url: "/containerLo=
gs/podNamespace/podID/containerName", bucket: "containerLogs"},
> >> ++              "cri":                             {url: "/cri/", buck=
et: "cri"},
> >> ++              "cri with sub":                    {url: "/cri/foo", b=
ucket: "cri"},
> >> ++              "debug v flags":                   {url: "/debug/flags=
/v", bucket: "debug"},
> >> ++              "pprof with sub":                  {url: "/debug/pprof=
/subpath", bucket: "debug"},
> >> ++              "exec":                            {url: "/exec/podNam=
espace/podID/containerName", bucket: "exec"},
> >> ++              "exec with uid":                   {url: "/exec/podNam=
espace/podID/uid/containerName", bucket: "exec"},
> >> ++              "healthz":                         {url: "/healthz/", =
bucket: "healthz"},
> >> ++              "healthz log sub":                 {url: "/healthz/log=
", bucket: "healthz"},
> >> ++              "healthz ping":                    {url: "/healthz/pin=
g", bucket: "healthz"},
> >> ++              "healthz sync loop":               {url: "/healthz/syn=
cloop", bucket: "healthz"},
> >> ++              "logs":                            {url: "/logs/", buc=
ket: "logs"},
> >> ++              "logs with path":                  {url: "/logs/logpat=
h", bucket: "logs"},
> >> ++              "metrics":                         {url: "/metrics", b=
ucket: "metrics"},
> >> ++              "metrics cadvisor sub":            {url: "/metrics/cad=
visor", bucket: "metrics/cadvisor"},
> >> ++              "metrics probes sub":              {url: "/metrics/pro=
bes", bucket: "metrics/probes"},
> >> ++              "metrics resource v1alpha1":       {url: "/metrics/res=
ource/v1alpha1", bucket: "metrics/resource"},
> >> ++              "metrics resource sub":            {url: "/metrics/res=
ource", bucket: "metrics/resource"},
> >> ++              "pods":                            {url: "/pods/", buc=
ket: "pods"},
> >> ++              "portForward":                     {url: "/portForward=
/podNamespace/podID", bucket: "portForward"},
> >> ++              "portForward with uid":            {url: "/portForward=
/podNamespace/podID/uid", bucket: "portForward"},
> >> ++              "run":                             {url: "/run/podName=
space/podID/containerName", bucket: "run"},
> >> ++              "run with uid":                    {url: "/run/podName=
space/podID/uid/containerName", bucket: "run"},
> >> ++              "runningpods":                     {url: "/runningpods=
/", bucket: "runningpods"},
> >> ++              "spec":                            {url: "/spec/", buc=
ket: "spec"},
> >> ++              "stats":                           {url: "/stats/", bu=
cket: "stats"},
> >> ++              "stats container sub":             {url: "/stats/conta=
iner", bucket: "stats"},
> >> ++              "stats summary sub":               {url: "/stats/summa=
ry", bucket: "stats"},
> >> ++              "stats containerName with uid":    {url: "/stats/names=
pace/podName/uid/containerName", bucket: "stats"},
> >> ++              "stats containerName":             {url: "/stats/podNa=
me/containerName", bucket: "stats"},
> >> ++              "invalid path":                    {url: "/junk", buck=
et: "Invalid path"},
> >> ++              "invalid path starting with good": {url: "/healthzjunk=
", bucket: "Invalid path"},
> >> ++      }
> >> ++      fw :=3D newServerTest()
> >> ++      defer fw.testHTTPServer.Close()
> >> ++
> >> ++      for _, test :=3D range tests {
> >> ++              path :=3D test.url
> >> ++              bucket :=3D test.bucket
> >> ++              require.Equal(t, fw.serverUnderTest.getMetricBucket(pa=
th), bucket)
> >> ++      }
> >> ++}
> >> ++
> >> + func TestDebuggingDisabledHandlers(t *testing.T) {
> >> +       fw :=3D newServerTestWithDebug(false, false, nil)
> >> +       defer fw.testHTTPServer.Close()
> >> +@@ -1685,6 +1737,6 @@ func TestTrimURLPath(t *testing.T) {
> >> +       }
> >> +
> >> +       for _, test :=3D range tests {
> >> +-              assert.Equal(t, test.expected, trimURLPath(test.path),=
 fmt.Sprintf("path is: %s", test.path))
> >> ++              assert.Equal(t, test.expected, getURLRootPath(test.pat=
h), fmt.Sprintf("path is: %s", test.path))
> >> +       }
> >> + }
> >> +--
> >> +2.17.0
> >> +
> >> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.pa=
tch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch
> >> new file mode 100644
> >> index 0000000..85d7fcb
> >> --- /dev/null
> >> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8552.patch
> >> @@ -0,0 +1,170 @@
> >> +From cc3190968b1f14ddf4067abef849fc41bd6068dc Mon Sep 17 00:00:00 200=
1
> >> +From: Han Kang <hankang@google.com>
> >> +Date: Wed, 29 Jan 2020 12:25:55 -0800
> >> +Subject: [PATCH] remove client label from apiserver request count met=
ric since
> >> + it is unbounded
> >> +
> >> +Change-Id: I3a9eacebc9d9dc9ed6347260d9378cdcb5743431
> >> +
> >> +CVE: CVE-2020-8552
> >> +Upstream-Status: Backport [Cherry-picked from https://github.com/kube=
rnetes/kubernetes.git tag:v1.18.0]
> >> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> >> +---
> >> + .../apiserver/pkg/endpoints/metrics/BUILD     |  8 ---
> >> + .../pkg/endpoints/metrics/metrics.go          | 21 ++------
> >> + .../pkg/endpoints/metrics/metrics_test.go     | 54 -----------------=
--
> >> + 3 files changed, 3 insertions(+), 80 deletions(-)
> >> + delete mode 100644 staging/src/k8s.io/apiserver/pkg/endpoints/metric=
s/metrics_test.go
> >> +
> >> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/me=
trics/BUILD b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics=
/BUILD
> >> +index 8d13a34eadc..8abb3d1a611 100644
> >> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/B=
UILD
> >> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/B=
UILD
> >> +@@ -3,13 +3,6 @@ package(default_visibility =3D ["//visibility:public=
"])
> >> + load(
> >> +     "@io_bazel_rules_go//go:def.bzl",
> >> +     "go_library",
> >> +-    "go_test",
> >> +-)
> >> +-
> >> +-go_test(
> >> +-    name =3D "go_default_test",
> >> +-    srcs =3D ["metrics_test.go"],
> >> +-    embed =3D [":go_default_library"],
> >> + )
> >> +
> >> + go_library(
> >> +@@ -20,7 +13,6 @@ go_library(
> >> +     deps =3D [
> >> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1/validati=
on:go_default_library",
> >> +         "//staging/src/k8s.io/apimachinery/pkg/types:go_default_libr=
ary",
> >> +-        "//staging/src/k8s.io/apimachinery/pkg/util/net:go_default_l=
ibrary",
> >> +         "//staging/src/k8s.io/apimachinery/pkg/util/sets:go_default_=
library",
> >> +         "//staging/src/k8s.io/apiserver/pkg/endpoints/request:go_def=
ault_library",
> >> +         "//staging/src/k8s.io/apiserver/pkg/features:go_default_libr=
ary",
> >> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/me=
trics/metrics.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/me=
trics/metrics.go
> >> +index f4e02fbb6a8..c79efdef4e3 100644
> >> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/m=
etrics.go
> >> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/m=
etrics.go
> >> +@@ -29,7 +29,6 @@ import (
> >> +
> >> +       "k8s.io/apimachinery/pkg/apis/meta/v1/validation"
> >> +       "k8s.io/apimachinery/pkg/types"
> >> +-      utilnet "k8s.io/apimachinery/pkg/util/net"
> >> +       utilsets "k8s.io/apimachinery/pkg/util/sets"
> >> +       "k8s.io/apiserver/pkg/endpoints/request"
> >> +       "k8s.io/apiserver/pkg/features"
> >> +@@ -66,14 +65,14 @@ var (
> >> +       requestCounter =3D compbasemetrics.NewCounterVec(
> >> +               &compbasemetrics.CounterOpts{
> >> +                       Name:           "apiserver_request_total",
> >> +-                      Help:           "Counter of apiserver requests=
 broken out for each verb, dry run value, group, version, resource, scope, =
component, client, and HTTP response contentType and code.",
> >> ++                      Help:           "Counter of apiserver requests=
 broken out for each verb, dry run value, group, version, resource, scope, =
component, and HTTP response contentType and code.",
> >> +                       StabilityLevel: compbasemetrics.ALPHA,
> >> +               },
> >> +               // The label_name contentType doesn't follow the label=
_name convention defined here:
> >> +               // https://github.com/kubernetes/community/blob/master=
/contributors/devel/sig-instrumentation/instrumentation.md
> >> +               // But changing it would break backwards compatibility=
. Future label_names
> >> +               // should be all lowercase and separated by underscore=
s.
> >> +-              []string{"verb", "dry_run", "group", "version", "resou=
rce", "subresource", "scope", "component", "client", "contentType", "code"}=
,
> >> ++              []string{"verb", "dry_run", "group", "version", "resou=
rce", "subresource", "scope", "component", "contentType", "code"},
> >> +       )
> >> +       deprecatedRequestCounter =3D compbasemetrics.NewCounterVec(
> >> +               &compbasemetrics.CounterOpts{
> >> +@@ -243,11 +242,10 @@ func RecordLongRunning(req *http.Request, reque=
stInfo *request.RequestInfo, comp
> >> + func MonitorRequest(req *http.Request, verb, group, version, resourc=
e, subresource, scope, component, contentType string, httpCode, respSize in=
t, elapsed time.Duration) {
> >> +       reportedVerb :=3D cleanVerb(verb, req)
> >> +       dryRun :=3D cleanDryRun(req.URL)
> >> +-      client :=3D cleanUserAgent(utilnet.GetHTTPClient(req))
> >> +       elapsedMicroseconds :=3D float64(elapsed / time.Microsecond)
> >> +       elapsedSeconds :=3D elapsed.Seconds()
> >> +-      requestCounter.WithLabelValues(reportedVerb, dryRun, group, ve=
rsion, resource, subresource, scope, component, client, contentType, codeTo=
String(httpCode)).Inc()
> >> +-      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, =
version, resource, subresource, scope, component, client, contentType, code=
ToString(httpCode)).Inc()
> >> ++      requestCounter.WithLabelValues(reportedVerb, dryRun, group, ve=
rsion, resource, subresource, scope, component, contentType, codeToString(h=
ttpCode)).Inc()
> >> ++      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, =
version, resource, subresource, scope, component, contentType, codeToString=
(httpCode)).Inc()
> >> +       requestLatencies.WithLabelValues(reportedVerb, dryRun, group, =
version, resource, subresource, scope, component).Observe(elapsedSeconds)
> >> +       deprecatedRequestLatencies.WithLabelValues(reportedVerb, group=
, version, resource, subresource, scope, component).Observe(elapsedMicrosec=
onds)
> >> +       deprecatedRequestLatenciesSummary.WithLabelValues(reportedVerb=
, group, version, resource, subresource, scope, component).Observe(elapsedM=
icroseconds)
> >> +@@ -355,19 +353,6 @@ func cleanDryRun(u *url.URL) string {
> >> +       return strings.Join(utilsets.NewString(dryRun...).List(), ",")
> >> + }
> >> +
> >> +-func cleanUserAgent(ua string) string {
> >> +-      // We collapse all "web browser"-type user agents into one "br=
owser" to reduce metric cardinality.
> >> +-      if strings.HasPrefix(ua, "Mozilla/") {
> >> +-              return "Browser"
> >> +-      }
> >> +-      // If an old "kubectl.exe" has passed us its full path, we dis=
card the path portion.
> >> +-      if kubectlExeRegexp.MatchString(ua) {
> >> +-              // avoid an allocation
> >> +-              ua =3D kubectlExeRegexp.ReplaceAllString(ua, "$1")
> >> +-      }
> >> +-      return ua
> >> +-}
> >> +-
> >> + // ResponseWriterDelegator interface wraps http.ResponseWriter to ad=
ditionally record content-length, status-code, etc.
> >> + type ResponseWriterDelegator struct {
> >> +       http.ResponseWriter
> >> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/me=
trics/metrics_test.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoin=
ts/metrics/metrics_test.go
> >> +deleted file mode 100644
> >> +index 4c0a8aa5d27..00000000000
> >> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/m=
etrics_test.go
> >> ++++ /dev/null
> >> +@@ -1,54 +0,0 @@
> >> +-/*
> >> +-Copyright 2015 The Kubernetes Authors.
> >> +-
> >> +-Licensed under the Apache License, Version 2.0 (the "License");
> >> +-you may not use this file except in compliance with the License.
> >> +-You may obtain a copy of the License at
> >> +-
> >> +-    http://www.apache.org/licenses/LICENSE-2.0
> >> +-
> >> +-Unless required by applicable law or agreed to in writing, software
> >> +-distributed under the License is distributed on an "AS IS" BASIS,
> >> +-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
> >> +-See the License for the specific language governing permissions and
> >> +-limitations under the License.
> >> +-*/
> >> +-
> >> +-package metrics
> >> +-
> >> +-import "testing"
> >> +-
> >> +-func TestCleanUserAgent(t *testing.T) {
> >> +-      panicBuf :=3D []byte{198, 73, 129, 133, 90, 216, 104, 29, 13, =
134, 209, 233, 30, 0, 22}
> >> +-
> >> +-      for _, tc :=3D range []struct {
> >> +-              In  string
> >> +-              Out string
> >> +-      }{
> >> +-              {
> >> +-                      In:  "Mozilla/5.0 (Macintosh; Intel Mac OS X 1=
0_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/=
537.36",
> >> +-                      Out: "Browser",
> >> +-              },
> >> +-              {
> >> +-                      In:  "kubectl/v1.2.4",
> >> +-                      Out: "kubectl/v1.2.4",
> >> +-              },
> >> +-              {
> >> +-                      In:  `C:\Users\Kubernetes\kubectl.exe/v1.5.4`,
> >> +-                      Out: "kubectl.exe/v1.5.4",
> >> +-              },
> >> +-              {
> >> +-                      In:  `C:\Program Files\kubectl.exe/v1.5.4`,
> >> +-                      Out: "kubectl.exe/v1.5.4",
> >> +-              },
> >> +-              {
> >> +-                      // This malicious input courtesy of enisoc.
> >> +-                      In:  string(panicBuf) + "kubectl.exe",
> >> +-                      Out: "kubectl.exe",
> >> +-              },
> >> +-      } {
> >> +-              if cleanUserAgent(tc.In) !=3D tc.Out {
> >> +-                      t.Errorf("Failed to clean User-Agent: %s", tc.=
In)
> >> +-              }
> >> +-      }
> >> +-}
> >> +--
> >> +2.17.0
> >> +
> >> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes=
-containers/kubernetes/kubernetes_git.bb
> >> index fae554d..c378ccc 100644
> >> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> >> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> >> @@ -12,6 +12,8 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.=
git;branch=3Drelease-1.16;name=3Dk
> >>              file://0001-hack-lib-golang.sh-use-CC-from-environment.pa=
tch \
> >>              file://0001-cross-don-t-build-tests-by-default.patch \
> >>              file://0001-fix-compiling-failure-execvp-bin-bash-Argumen=
t-list-.patch \
> >> +           file://CVE-2020-8551.patch \
> >> +           file://CVE-2020-8552.patch \
> >>             "
> >>
> >>   DEPENDS +=3D "rsync-native \
> >> --
> >> 2.23.0
> >>
> >
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
