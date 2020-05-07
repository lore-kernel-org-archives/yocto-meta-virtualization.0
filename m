Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.55])
 by mx.groups.io with SMTP id smtpd.web11.7674.1588863199570665118
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2020 07:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nz1b2K8/;
 spf=pass (domain: windriver.com, ip: 40.107.94.55, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRfT7JrOnv8V9YOfWjObnUjbilZaD1OVOr+eW8rp0d4IgNaQuQHFEujbtenCTtYf5aV+Fjj9dGPl0j8bDkaizr9tgEN5JxPz8pzLn+QS+eImqYYXnp1pmko/iJ9f9JKzRl7HKC7QM8NqcmIlEqOtDq5HwrFbSUx8aAczhIX5jRB1/YumBQ7jRlVeRTRBmFCNLR+h4DqX45EFFa+SKxz0/ZztVBg3a30AltM35XqZN02pV+xsVbqt/onHUqSxhhC7CRgxgtWnk4eNQORsRAzYMGknxh7Cf0udlmOqN1xiCGdIXMxtWmO78oZOIWHhJiT4FIcZau/R6eVvzB8y9nYqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BgXYWW/HVY3NFNDdhFg3QfFf81cb1DIHT8VxaFgOVw=;
 b=oLBZHnbsEqeSYWoU6gQqocwoy1tqYEwlkErPcArfWQ9oV2pb5+gnX40ZJjJL3rAhufmzFSXLFV1jyyFmyBrBLqPQD5rJttEySwJGb2nEzJWh5pghvO71YEe2NvGtgzEp2rxoAizlsnMO90sOf4CYZLOM2admGc97i7dfF7luQaEjxmcAVfXE5KiSXbE8cCeME47Cpflji7fuyu0y6Qhb47vCJa13rRHN1s9SXke7NckHX1/At2EeMr72Oo0KjlDTls8KqdWWd/W14LFwHtTdW81ZHTW9g8oK9jyJrB+Kzp4NHBgZVeCW+i2ZJtICNZNOa6/VnKLoD5nl9jW6qyQx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BgXYWW/HVY3NFNDdhFg3QfFf81cb1DIHT8VxaFgOVw=;
 b=nz1b2K8/CkFmIcmN3P6v2pHLc4zLqM9Rcd5wMHA0PH47jP/ct8Rt3UDbuVCIum5phhAuFXHDkkbJrUKNwgjIhGSSsXKRzEac2/3mKmZPyfKb5CX2oszUI2ZXp3M3BMhOA0WVSiD5x4TdNx4kaSFg8FDb5jKFSP1Eknz+Vp+pl3Y=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB4269.namprd11.prod.outlook.com (2603:10b6:208:190::32)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 14:53:16 +0000
Received: from MN2PR11MB4269.namprd11.prod.outlook.com
 ([fe80::ef:e9a9:8618:bc9f]) by MN2PR11MB4269.namprd11.prod.outlook.com
 ([fe80::ef:e9a9:8618:bc9f%7]) with mapi id 15.20.2958.030; Thu, 7 May 2020
 14:53:16 +0000
Subject: Re: [meta-virtualization][PATCH] kubernetes: Backport CVE fixes
To: meta-virtualization@lists.yoctoproject.org
References: <20200429174927.154541-1-sakib.sajal@windriver.com>
 <CADkTA4ObCkP62dLaEj_w1hrWFsB6ANrSPv2uSpd-NGx7g2sY1g@mail.gmail.com>
From: sakib.sajal@windriver.com
Message-ID: <152f8d60-ff8e-fa93-510d-f17a76428df7@windriver.com>
Date: Thu, 7 May 2020 10:53:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4ObCkP62dLaEj_w1hrWFsB6ANrSPv2uSpd-NGx7g2sY1g@mail.gmail.com>
X-ClientProxiedBy: YQBPR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::41) To MN2PR11MB4269.namprd11.prod.outlook.com
 (2603:10b6:208:190::32)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (64.229.138.221) by YQBPR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 14:53:15 +0000
X-Originating-IP: [64.229.138.221]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bef1d963-be65-4ef0-5d06-08d7f2965f44
X-MS-TrafficTypeDiagnostic: MN2PR11MB4744:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4744C2BB5620197A99E6605EF2A50@MN2PR11MB4744.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YhBX3wqQdPIiHURB6RsCUvajOkBUi+0jWUubKRDacEV2lGGplCRdHm13yguPJDM5jVKubStp/5Y9DXSpr+1QPByj65VCsmLNbAZ+Ki0RFOqGykezdwMe+XSE8t2ibEYunFP5wZYF/ej/h1QFI4HUaYmO/5qlFfNqkPpAj89HUMd92YYoxcc+wmJOArLg1OrOgTTTz+Xq6X8ngZYPXiI2SCSZXIcTe41vZg5u0xh0mNavgRHDMa/6diSYvtNtlysanRePfRrKs+k0WzI4UTx/GkylGQRVlc05zOwz4sj9tvdiVHXTw8qQsQgYI1ZUtwrQ6QYtMiss4bz5eHLOzg9c4MJqzdfKz93wJX/SouEdHb08bVgTpOgI3/+eKQZKSomacZXzJGK5H8Bu+SWVqKYhM3OCbNYdRwRos6miv1zXqyelP/pTJk4QAiFzwqsBN5boxGtI4/lFdpHyqm2fjL3gNtjreRZyxzHX5ASghqnCoaoq6h+WS7Q4IBjBwnC59++Ub2FkywrPYWhIJWgLagFSrU1PvWKoyEIhMWFyuKjjQ3J6l7Cf/zh4xLLiAC/6NIpU5K3lk3Bz5Bn8pSxUpPMelcVaDKNmykBHE7vdw43xRIUhxYJfu9rFjGQ3lzZk96BF94v0lBOszk6ueikwlwcq75o4Kqb7vitC6Pbm1Wac/mU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4269.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(346002)(136003)(376002)(33430700001)(16576012)(956004)(31686004)(16526019)(66946007)(6916009)(44832011)(6486002)(166002)(966005)(83320400001)(478600001)(83300400001)(83280400001)(83310400001)(83290400001)(31696002)(2906002)(6666004)(8936002)(53546011)(66574014)(33964004)(52116002)(86362001)(316002)(19627235002)(66476007)(66556008)(8676002)(5660300002)(26005)(33440700001)(186003)(2616005)(30864003)(36756003)(21314003)(43740500002)(569008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7IDuQlr5XpzPb68H2ydZEUBXFVDdbZ126CxgPcGzm6v8anvwu3L15D1RVpO85O2KosdozLHmqNUkniFf1d7vyYkChXVT+Cfh7eGBZAzujFxjuyZ6wUjSSKSl0Hq3Hvfa2LtSQPtxKqxHsxjSNFO4bUluxbkSZPyVAKI77DAPMaIrudmUajkW9qyfK72EJ1H2AFvyIAkR1HtL35zF1X+WW8BHuvqeWkFhB9nFdVZ2yfWrqfg+M8Js6obljZzYoofaD78Ke/8e7hUOa9JG8y+GoWLmHbu0n2zWtNEhmnrkiqC5DgP7HOcOy5jfdl2mPTi31hGEbyffvwHW9gaFMk8gsTviblHACmbU8Vz5hLoDQCj2bD05JOV5S2H/Ue/+7DU6YmqcHduxcFiBvVJgJ9kemlzqn4AHZIeGeP8+XoKXC2585wL7Z7rzcCzujoUbACdhDadXlWi9zSRV1B1mS+M0/ISImLlq+Sp4zW4gR+K2MSqyM27KvJWu5Mq94/voXbHve4fJc054PCTt05W9sYxDVA8S8oj9/lBhaVrbxwL7mke8jhKGt884IVEmHB2Z8TmFxAgpk0rLzJt9aMA3+Roa+KTRX4oaVKi+SOkgXswEhvmXpWxJxzzUgeCTdOrEexnz907ZMu/7HChSs18xFqx2L0+P0yYJM5Mto6EW0SN5UdpUhEOA1XZIt04eNbDA6AlIwl8bkVFUJwcBDI+l4OyRdqGKkb5LQZB55iMIs3W9wD5JMfF7QvV9THp37Y7XUPWK+C9UdZH0uijZyt8DJW6+8L52iTvj4UgjSVDdpLz2U2Q=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef1d963-be65-4ef0-5d06-08d7f2965f44
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 14:53:15.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vn7RGm59ifym1FFe5OApGhKKoINy1saHTXTAqg4Q5776F5KGIHbX5+ewAcgbrDNvkHcnbPDHcNujnWZePKba6YVz5aSLzIkbyqnIktkAfzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
Content-Type: multipart/alternative;
 boundary="------------01EB55A8D2F3BB3D02E028C9"
Content-Language: en-US

--------------01EB55A8D2F3BB3D02E028C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020-04-29 3:28 p.m., Bruce Ashfield wrote:
> I'm nearly complete on an kubernetes refresh, so I won't merge this
> patch to master, and I'm inclined to do the uprev even in dunfell.
>
> If this patch is destined for dunfell, that should indicated clearly
> in the patch subject.
>
> Cheers,
>
> Bruce


Thank you for taking the time to review the changes.

What version are you refreshing to?


Sakib

>
> On Wed, Apr 29, 2020 at 1:49 PM <sakib.sajal@windriver.com> wrote:
>> CVE: CVE-2020-8551
>>          - 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1
>>          - 9802bfcec0580169cffce2a3d468689a407fa7dc
>>          - c394d821fdafd719619eb63fcd1065a95ec02ef9
>>
>> CVE: CVE-2020-8552
>>          - cc3190968b1f14ddf4067abef849fc41bd6068dc
>>
>> CVE: CVE-2019-11254
>>          - a290fe55cb2f4593eb4ec5bf410cd77b9d925464
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   ...-to-fix-kubelet-metrics-memory-issue.patch | 313 +++++++
>>   ...dd-new-endpoint-for-resource-metrics.patch | 440 ++++++++++
>>   .../0001-Deal-with-auto-generated-files.patch |  60 ++
>>   ...bel-from-apiserver-request-count-met.patch | 171 ++++
>>   ...01-update-gopkg.in-yaml.v2-to-v2.2.8.patch | 825 ++++++++++++++++++
>>   .../kubernetes/kubernetes_git.bb              |   5 +
>>   6 files changed, 1814 insertions(+)
>>   create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
>>   create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
>>   create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
>>   create mode 100644 recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
>>   create mode 100644 recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch
>>
>> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch b/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
>> new file mode 100644
>> index 0000000..5369f04
>> --- /dev/null
>> +++ b/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
>> @@ -0,0 +1,313 @@
>> +From 0bf092ccc5fccb06b13afe5da86286a856d96770 Mon Sep 17 00:00:00 2001
>> +From: Walter Fender <wfender@google.com>
>> +Date: Thu, 6 Feb 2020 19:10:18 -0800
>> +Subject: [PATCH] Add code to fix kubelet/metrics memory issue.
>> +
>> +Bucketing url paths based on concept/handling.
>> +Bucketing code placed by handling code to encourage usage.
>> +Added unit tests.
>> +Fix format.
>> +
>> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pull/87913/commits/9802bfcec0580169cffce2a3d468689a407fa7dc]
>> +CVE: CVE-2020-8551
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + pkg/kubelet/server/server.go      | 57 ++++++++++++++++++++++++++++---
>> + pkg/kubelet/server/server_test.go | 54 ++++++++++++++++++++++++++++-
>> + 2 files changed, 106 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/kubelet/server/server.go
>> +index 0f953c92502..05c1dc9c701 100644
>> +--- a/src/import/pkg/kubelet/server/server.go
>> ++++ b/src/import/pkg/kubelet/server/server.go
>> +@@ -89,6 +89,7 @@ type Server struct {
>> +       auth                       AuthInterface
>> +       host                       HostInterface
>> +       restfulCont                containerInterface
>> ++      metricsBuckets             map[string]bool
>> +       resourceAnalyzer           stats.ResourceAnalyzer
>> +       redirectContainerStreaming bool
>> + }
>> +@@ -225,6 +226,7 @@ func NewServer(
>> +               resourceAnalyzer:           resourceAnalyzer,
>> +               auth:                       auth,
>> +               restfulCont:                &filteringContainer{Container: restful.NewContainer()},
>> ++              metricsBuckets:             make(map[string]bool),
>> +               redirectContainerStreaming: redirectContainerStreaming,
>> +       }
>> +       if auth != nil {
>> +@@ -280,14 +282,32 @@ func (s *Server) InstallAuthFilter() {
>> +       })
>> + }
>> +
>> ++// addMetricsBucketMatcher adds a regexp matcher and the relevant bucket to use when
>> ++// it matches. Please be aware this is not thread safe and should not be used dynamically
>> ++func (s *Server) addMetricsBucketMatcher(bucket string) {
>> ++      s.metricsBuckets[bucket] = true
>> ++}
>> ++
>> ++// getMetricBucket find the appropriate metrics reporting bucket for the given path
>> ++func (s *Server) getMetricBucket(path string) string {
>> ++      root := getURLRootPath(path)
>> ++      if s.metricsBuckets[root] == true {
>> ++              return root
>> ++      }
>> ++      return "Invalid path"
>> ++}
>> ++
>> + // InstallDefaultHandlers registers the default set of supported HTTP request
>> + // patterns with the restful Container.
>> + func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> ++      s.addMetricsBucketMatcher("healthz")
>> +       healthz.InstallHandler(s.restfulCont,
>> +               healthz.PingHealthz,
>> +               healthz.LogHealthz,
>> +               healthz.NamedCheck("syncloop", s.syncLoopHealthCheck),
>> +       )
>> ++
>> ++      s.addMetricsBucketMatcher("pods")
>> +       ws := new(restful.WebService)
>> +       ws.
>> +               Path("/pods").
>> +@@ -297,7 +317,14 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> +               Operation("getPods"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("stats")
>> +       s.restfulCont.Add(stats.CreateHandlers(statsPath, s.host, s.resourceAnalyzer, enableCAdvisorJSONEndpoints))
>> ++
>> ++      s.addMetricsBucketMatcher("metrics")
>> ++      s.addMetricsBucketMatcher("metrics/cadvisor")
>> ++      s.addMetricsBucketMatcher("metrics/probes")
>> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
>> ++      s.addMetricsBucketMatcher("metrics/resource")
>> +       //lint:ignore SA1019 https://github.com/kubernetes/enhancements/issues/1206
>> +       s.restfulCont.Handle(metricsPath, legacyregistry.Handler())
>> +
>> +@@ -320,12 +347,15 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> +               compbasemetrics.HandlerFor(r, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
>> +       )
>> +
>> ++      // deprecated endpoint which will be removed in release 1.20.0+.
>> ++      s.addMetricsBucketMatcher("metrics/resource/v1alpha1")
>> +       v1alpha1ResourceRegistry := compbasemetrics.NewKubeRegistry()
>> +       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusResourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
>> +       s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Version),
>> +               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
>> +       )
>> +
>> ++      s.addMetricsBucketMatcher("metrics/resource")
>> +       resourceRegistry := compbasemetrics.NewKubeRegistry()
>> +       resourceRegistry.CustomMustRegister(collectors.NewResourceMetricsCollector(s.resourceAnalyzer))
>> +       s.restfulCont.Handle(resourceMetricsPath,
>> +@@ -334,6 +364,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> +
>> +       // prober metrics are exposed under a different endpoint
>> +
>> ++      s.addMetricsBucketMatcher("metrics/probes")
>> +       p := compbasemetrics.NewKubeRegistry()
>> +       compbasemetrics.RegisterProcessStartTime(p.RawRegister)
>> +       p.MustRegister(prober.ProberResults)
>> +@@ -341,6 +372,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> +               compbasemetrics.HandlerFor(p, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
>> +       )
>> +
>> ++      s.addMetricsBucketMatcher("spec")
>> +       if enableCAdvisorJSONEndpoints {
>> +               ws := new(restful.WebService)
>> +               ws.
>> +@@ -360,6 +392,7 @@ const pprofBasePath = "/debug/pprof/"
>> + func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +       klog.Infof("Adding debug handlers to kubelet server.")
>> +
>> ++      s.addMetricsBucketMatcher("run")
>> +       ws := new(restful.WebService)
>> +       ws.
>> +               Path("/run")
>> +@@ -371,6 +404,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getRun"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("exec")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path("/exec")
>> +@@ -388,6 +422,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getExec"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("attach")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path("/attach")
>> +@@ -405,6 +440,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getAttach"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("portForward")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path("/portForward")
>> +@@ -422,6 +458,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getPortForward"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("logs")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path(logsPath)
>> +@@ -434,6 +471,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Param(ws.PathParameter("logpath", "path to the log").DataType("string")))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("containerLogs")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path("/containerLogs")
>> +@@ -442,8 +480,10 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getContainerLogs"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("configz")
>> +       configz.InstallHandler(s.restfulCont)
>> +
>> ++      s.addMetricsBucketMatcher("debug")
>> +       handlePprofEndpoint := func(req *restful.Request, resp *restful.Response) {
>> +               name := strings.TrimPrefix(req.Request.URL.Path, pprofBasePath)
>> +               switch name {
>> +@@ -459,7 +499,6 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +                       pprof.Index(resp, req.Request)
>> +               }
>> +       }
>> +-
>> +       // Setup pprof handlers.
>> +       ws = new(restful.WebService).Path(pprofBasePath)
>> +       ws.Route(ws.GET("/{subpath:*}").To(func(req *restful.Request, resp *restful.Response) {
>> +@@ -472,6 +511,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +       s.restfulCont.Handle("/debug/flags/v", routes.StringFlagPutHandler(logs.GlogSetter))
>> +
>> +       // The /runningpods endpoint is used for testing only.
>> ++      s.addMetricsBucketMatcher("runningpods")
>> +       ws = new(restful.WebService)
>> +       ws.
>> +               Path("/runningpods/").
>> +@@ -481,6 +521,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
>> +               Operation("getRunningPods"))
>> +       s.restfulCont.Add(ws)
>> +
>> ++      s.addMetricsBucketMatcher("cri")
>> +       if criHandler != nil {
>> +               s.restfulCont.Handle("/cri/", criHandler)
>> +       }
>> +@@ -492,6 +533,14 @@ func (s *Server) InstallDebuggingDisabledHandlers() {
>> +               http.Error(w, "Debug endpoints are disabled.", http.StatusMethodNotAllowed)
>> +       })
>> +
>> ++      s.addMetricsBucketMatcher("run")
>> ++      s.addMetricsBucketMatcher("exec")
>> ++      s.addMetricsBucketMatcher("attach")
>> ++      s.addMetricsBucketMatcher("portForward")
>> ++      s.addMetricsBucketMatcher("containerLogs")
>> ++      s.addMetricsBucketMatcher("runningpods")
>> ++      s.addMetricsBucketMatcher("pprof")
>> ++      s.addMetricsBucketMatcher("logs")
>> +       paths := []string{
>> +               "/run/", "/exec/", "/attach/", "/portForward/", "/containerLogs/",
>> +               "/runningpods/", pprofBasePath, logsPath}
>> +@@ -808,10 +857,10 @@ func (s *Server) getPortForward(request *restful.Request, response *restful.Resp
>> +       proxyStream(response.ResponseWriter, request.Request, url)
>> + }
>> +
>> +-// trimURLPath trims a URL path.
>> ++// getURLRootPath trims a URL path.
>> + // For paths in the format of "/metrics/xxx", "metrics/xxx" is returned;
>> + // For all other paths, the first part of the path is returned.
>> +-func trimURLPath(path string) string {
>> ++func getURLRootPath(path string) string {
>> +       parts := strings.SplitN(strings.TrimPrefix(path, "/"), "/", 3)
>> +       if len(parts) == 0 {
>> +               return path
>> +@@ -859,7 +908,7 @@ func (s *Server) ServeHTTP(w http.ResponseWriter, req *http.Request) {
>> +               serverType = "readwrite"
>> +       }
>> +
>> +-      method, path := req.Method, trimURLPath(req.URL.Path)
>> ++      method, path := req.Method, s.getMetricBucket(req.URL.Path)
>> +
>> +       longRunning := strconv.FormatBool(isLongRunningRequest(path))
>> +
>> +diff --git a/src/import/pkg/kubelet/server/server_test.go b/src/import/pkg/kubelet/server/server_test.go
>> +index eba788b50ea..5e6a1cc0588 100644
>> +--- a/src/import/pkg/kubelet/server/server_test.go
>> ++++ b/src/import/pkg/kubelet/server/server_test.go
>> +@@ -1460,6 +1460,58 @@ func TestCRIHandler(t *testing.T) {
>> +       assert.Equal(t, query, fw.criHandler.RequestReceived.URL.RawQuery)
>> + }
>> +
>> ++func TestMetricBuckets(t *testing.T) {
>> ++      tests := map[string]struct {
>> ++              url    string
>> ++              bucket string
>> ++      }{
>> ++              "healthz endpoint":                {url: "/healthz", bucket: "healthz"},
>> ++              "attach":                          {url: "/attach/podNamespace/podID/containerName", bucket: "attach"},
>> ++              "attach with uid":                 {url: "/attach/podNamespace/podID/uid/containerName", bucket: "attach"},
>> ++              "configz":                         {url: "/configz", bucket: "configz"},
>> ++              "containerLogs":                   {url: "/containerLogs/podNamespace/podID/containerName", bucket: "containerLogs"},
>> ++              "cri":                             {url: "/cri/", bucket: "cri"},
>> ++              "cri with sub":                    {url: "/cri/foo", bucket: "cri"},
>> ++              "debug v flags":                   {url: "/debug/flags/v", bucket: "debug"},
>> ++              "pprof with sub":                  {url: "/debug/pprof/subpath", bucket: "debug"},
>> ++              "exec":                            {url: "/exec/podNamespace/podID/containerName", bucket: "exec"},
>> ++              "exec with uid":                   {url: "/exec/podNamespace/podID/uid/containerName", bucket: "exec"},
>> ++              "healthz":                         {url: "/healthz/", bucket: "healthz"},
>> ++              "healthz log sub":                 {url: "/healthz/log", bucket: "healthz"},
>> ++              "healthz ping":                    {url: "/healthz/ping", bucket: "healthz"},
>> ++              "healthz sync loop":               {url: "/healthz/syncloop", bucket: "healthz"},
>> ++              "logs":                            {url: "/logs/", bucket: "logs"},
>> ++              "logs with path":                  {url: "/logs/logpath", bucket: "logs"},
>> ++              "metrics":                         {url: "/metrics", bucket: "metrics"},
>> ++              "metrics cadvisor sub":            {url: "/metrics/cadvisor", bucket: "metrics/cadvisor"},
>> ++              "metrics probes sub":              {url: "/metrics/probes", bucket: "metrics/probes"},
>> ++              "metrics resource v1alpha1":       {url: "/metrics/resource/v1alpha1", bucket: "metrics/resource"},
>> ++              "metrics resource sub":            {url: "/metrics/resource", bucket: "metrics/resource"},
>> ++              "pods":                            {url: "/pods/", bucket: "pods"},
>> ++              "portForward":                     {url: "/portForward/podNamespace/podID", bucket: "portForward"},
>> ++              "portForward with uid":            {url: "/portForward/podNamespace/podID/uid", bucket: "portForward"},
>> ++              "run":                             {url: "/run/podNamespace/podID/containerName", bucket: "run"},
>> ++              "run with uid":                    {url: "/run/podNamespace/podID/uid/containerName", bucket: "run"},
>> ++              "runningpods":                     {url: "/runningpods/", bucket: "runningpods"},
>> ++              "spec":                            {url: "/spec/", bucket: "spec"},
>> ++              "stats":                           {url: "/stats/", bucket: "stats"},
>> ++              "stats container sub":             {url: "/stats/container", bucket: "stats"},
>> ++              "stats summary sub":               {url: "/stats/summary", bucket: "stats"},
>> ++              "stats containerName with uid":    {url: "/stats/namespace/podName/uid/containerName", bucket: "stats"},
>> ++              "stats containerName":             {url: "/stats/podName/containerName", bucket: "stats"},
>> ++              "invalid path":                    {url: "/junk", bucket: "Invalid path"},
>> ++              "invalid path starting with good": {url: "/healthzjunk", bucket: "Invalid path"},
>> ++      }
>> ++      fw := newServerTest()
>> ++      defer fw.testHTTPServer.Close()
>> ++
>> ++      for _, test := range tests {
>> ++              path := test.url
>> ++              bucket := test.bucket
>> ++              require.Equal(t, fw.serverUnderTest.getMetricBucket(path), bucket)
>> ++      }
>> ++}
>> ++
>> + func TestDebuggingDisabledHandlers(t *testing.T) {
>> +       fw := newServerTestWithDebug(false, false, nil)
>> +       defer fw.testHTTPServer.Close()
>> +@@ -1533,6 +1585,6 @@ func TestTrimURLPath(t *testing.T) {
>> +       }
>> +
>> +       for _, test := range tests {
>> +-              assert.Equal(t, test.expected, trimURLPath(test.path), fmt.Sprintf("path is: %s", test.path))
>> ++              assert.Equal(t, test.expected, getURLRootPath(test.path), fmt.Sprintf("path is: %s", test.path))
>> +       }
>> + }
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch b/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
>> new file mode 100644
>> index 0000000..82e5fc6
>> --- /dev/null
>> +++ b/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
>> @@ -0,0 +1,440 @@
>> +From 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1 Mon Sep 17 00:00:00 2001
>> +From: RainbowMango <renhongcai@huawei.com>
>> +Date: Sun, 15 Dec 2019 17:06:13 +0800
>> +Subject: [PATCH] Add new endpoint for resource metrics.
>> +
>> +This commit is required for context to fix CVE-2020-8551.
>> +
>> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pull/86282/commits/0db7074e1ad237af1a513bdf51160bf4b4cdc9f1]
>> +CVE: CVE-2020-8551
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + .../metrics/collectors/resource_metrics.go    | 153 ++++++++++++++
>> + .../collectors/resource_metrics_test.go       | 189 ++++++++++++++++++
>> + pkg/kubelet/server/auth_test.go               |   1 +
>> + pkg/kubelet/server/server.go                  |  23 ++-
>> + 4 files changed, 358 insertions(+), 8 deletions(-)
>> + create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics.go
>> + create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics_test.go
>> +
>> +diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
>> +new file mode 100644
>> +index 00000000000..a3667127903
>> +--- /dev/null
>> ++++ b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
>> +@@ -0,0 +1,153 @@
>> ++/*
>> ++Copyright 2019 The Kubernetes Authors.
>> ++
>> ++Licensed under the Apache License, Version 2.0 (the "License");
>> ++you may not use this file except in compliance with the License.
>> ++You may obtain a copy of the License at
>> ++
>> ++    http://www.apache.org/licenses/LICENSE-2.0
>> ++
>> ++Unless required by applicable law or agreed to in writing, software
>> ++distributed under the License is distributed on an "AS IS" BASIS,
>> ++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>> ++See the License for the specific language governing permissions and
>> ++limitations under the License.
>> ++*/
>> ++
>> ++package collectors
>> ++
>> ++import (
>> ++      "time"
>> ++
>> ++      "k8s.io/component-base/metrics"
>> ++      "k8s.io/klog"
>> ++      summary "k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1"
>> ++      "k8s.io/kubernetes/pkg/kubelet/server/stats"
>> ++)
>> ++
>> ++var (
>> ++      nodeCPUUsageDesc = metrics.NewDesc("node_cpu_usage_seconds",
>> ++              "Cumulative cpu time consumed by the node in core-seconds",
>> ++              nil,
>> ++              nil,
>> ++              metrics.ALPHA,
>> ++              "")
>> ++
>> ++      nodeMemoryUsageDesc = metrics.NewDesc("node_memory_working_set_bytes",
>> ++              "Current working set of the node in bytes",
>> ++              nil,
>> ++              nil,
>> ++              metrics.ALPHA,
>> ++              "")
>> ++
>> ++      containerCPUUsageDesc = metrics.NewDesc("container_cpu_usage_seconds",
>> ++              "Cumulative cpu time consumed by the container in core-seconds",
>> ++              []string{"container", "pod", "namespace"},
>> ++              nil,
>> ++              metrics.ALPHA,
>> ++              "")
>> ++
>> ++      containerMemoryUsageDesc = metrics.NewDesc("container_memory_working_set_bytes",
>> ++              "Current working set of the container in bytes",
>> ++              []string{"container", "pod", "namespace"},
>> ++              nil,
>> ++              metrics.ALPHA,
>> ++              "")
>> ++
>> ++      resouceScrapeResultDesc = metrics.NewDesc("scrape_error",
>> ++              "1 if there was an error while getting container metrics, 0 otherwise",
>> ++              nil,
>> ++              nil,
>> ++              metrics.ALPHA,
>> ++              "")
>> ++)
>> ++
>> ++// NewResourceMetricsCollector returns a metrics.StableCollector which exports resource metrics
>> ++func NewResourceMetricsCollector(provider stats.SummaryProvider) metrics.StableCollector {
>> ++      return &resourceMetricsCollector{
>> ++              provider: provider,
>> ++      }
>> ++}
>> ++
>> ++type resourceMetricsCollector struct {
>> ++      metrics.BaseStableCollector
>> ++
>> ++      provider stats.SummaryProvider
>> ++}
>> ++
>> ++// Check if resourceMetricsCollector implements necessary interface
>> ++var _ metrics.StableCollector = &resourceMetricsCollector{}
>> ++
>> ++// DescribeWithStability implements metrics.StableCollector
>> ++func (rc *resourceMetricsCollector) DescribeWithStability(ch chan<- *metrics.Desc) {
>> ++      ch <- nodeCPUUsageDesc
>> ++      ch <- nodeMemoryUsageDesc
>> ++      ch <- containerCPUUsageDesc
>> ++      ch <- containerMemoryUsageDesc
>> ++      ch <- resouceScrapeResultDesc
>> ++}
>> ++
>> ++// CollectWithStability implements metrics.StableCollector
>> ++// Since new containers are frequently created and removed, using the Gauge would
>> ++// leak metric collectors for containers or pods that no longer exist.  Instead, implement
>> ++// custom collector in a way that only collects metrics for active containers.
>> ++func (rc *resourceMetricsCollector) CollectWithStability(ch chan<- metrics.Metric) {
>> ++      var errorCount float64
>> ++      defer func() {
>> ++              ch <- metrics.NewLazyConstMetric(resouceScrapeResultDesc, metrics.GaugeValue, errorCount)
>> ++      }()
>> ++      statsSummary, err := rc.provider.GetCPUAndMemoryStats()
>> ++      if err != nil {
>> ++              errorCount = 1
>> ++              klog.Warningf("Error getting summary for resourceMetric prometheus endpoint: %v", err)
>> ++              return
>> ++      }
>> ++
>> ++      rc.collectNodeCPUMetrics(ch, statsSummary.Node)
>> ++      rc.collectNodeMemoryMetrics(ch, statsSummary.Node)
>> ++
>> ++      for _, pod := range statsSummary.Pods {
>> ++              for _, container := range pod.Containers {
>> ++                      rc.collectContainerCPUMetrics(ch, pod, container)
>> ++                      rc.collectContainerMemoryMetrics(ch, pod, container)
>> ++              }
>> ++      }
>> ++}
>> ++
>> ++func (rc *resourceMetricsCollector) collectNodeCPUMetrics(ch chan<- metrics.Metric, s summary.NodeStats) {
>> ++      if s.CPU == nil {
>> ++              return
>> ++      }
>> ++
>> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
>> ++              metrics.NewLazyConstMetric(nodeCPUUsageDesc, metrics.GaugeValue, float64(*s.CPU.UsageCoreNanoSeconds)/float64(time.Second)))
>> ++}
>> ++
>> ++func (rc *resourceMetricsCollector) collectNodeMemoryMetrics(ch chan<- metrics.Metric, s summary.NodeStats) {
>> ++      if s.Memory == nil {
>> ++              return
>> ++      }
>> ++
>> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
>> ++              metrics.NewLazyConstMetric(nodeMemoryUsageDesc, metrics.GaugeValue, float64(*s.Memory.WorkingSetBytes)))
>> ++}
>> ++
>> ++func (rc *resourceMetricsCollector) collectContainerCPUMetrics(ch chan<- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
>> ++      if s.CPU == nil {
>> ++              return
>> ++      }
>> ++
>> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
>> ++              metrics.NewLazyConstMetric(containerCPUUsageDesc, metrics.GaugeValue,
>> ++                      float64(*s.CPU.UsageCoreNanoSeconds)/float64(time.Second), s.Name, pod.PodRef.Name, pod.PodRef.Namespace))
>> ++}
>> ++
>> ++func (rc *resourceMetricsCollector) collectContainerMemoryMetrics(ch chan<- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
>> ++      if s.Memory == nil {
>> ++              return
>> ++      }
>> ++
>> ++      ch <- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
>> ++              metrics.NewLazyConstMetric(containerMemoryUsageDesc, metrics.GaugeValue,
>> ++                      float64(*s.Memory.WorkingSetBytes), s.Name, pod.PodRef.Name, pod.PodRef.Namespace))
>> ++}
>> +diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go
>> +new file mode 100644
>> +index 00000000000..b92aabbd675
>> +--- /dev/null
>> ++++ b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go
>> +@@ -0,0 +1,189 @@
>> ++/*
>> ++Copyright 2019 The Kubernetes Authors.
>> ++
>> ++Licensed under the Apache License, Version 2.0 (the "License");
>> ++you may not use this file except in compliance with the License.
>> ++You may obtain a copy of the License at
>> ++
>> ++    http://www.apache.org/licenses/LICENSE-2.0
>> ++
>> ++Unless required by applicable law or agreed to in writing, software
>> ++distributed under the License is distributed on an "AS IS" BASIS,
>> ++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>> ++See the License for the specific language governing permissions and
>> ++limitations under the License.
>> ++*/
>> ++
>> ++package collectors
>> ++
>> ++import (
>> ++      "fmt"
>> ++      "strings"
>> ++      "testing"
>> ++      "time"
>> ++
>> ++      "github.com/stretchr/testify/mock"
>> ++
>> ++      metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
>> ++      "k8s.io/component-base/metrics/testutil"
>> ++      statsapi "k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1"
>> ++)
>> ++
>> ++type mockSummaryProvider struct {
>> ++      mock.Mock
>> ++}
>> ++
>> ++func (m *mockSummaryProvider) Get(updateStats bool) (*statsapi.Summary, error) {
>> ++      args := m.Called(updateStats)
>> ++      return args.Get(0).(*statsapi.Summary), args.Error(1)
>> ++}
>> ++
>> ++func (m *mockSummaryProvider) GetCPUAndMemoryStats() (*statsapi.Summary, error) {
>> ++      args := m.Called()
>> ++      return args.Get(0).(*statsapi.Summary), args.Error(1)
>> ++}
>> ++
>> ++func TestCollectResourceMetrics(t *testing.T) {
>> ++      testTime := metav1.NewTime(time.Unix(2, 0)) // a static timestamp: 2000
>> ++      interestedMetrics := []string{
>> ++              "scrape_error",
>> ++              "node_cpu_usage_seconds",
>> ++              "node_memory_working_set_bytes",
>> ++              "container_cpu_usage_seconds",
>> ++              "container_memory_working_set_bytes",
>> ++      }
>> ++
>> ++      tests := []struct {
>> ++              name            string
>> ++              summary         *statsapi.Summary
>> ++              summaryErr      error
>> ++              expectedMetrics string
>> ++      }{
>> ++              {
>> ++                      name:       "error getting summary",
>> ++                      summary:    nil,
>> ++                      summaryErr: fmt.Errorf("failed to get summary"),
>> ++                      expectedMetrics: `
>> ++                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
>> ++                              # TYPE scrape_error gauge
>> ++                              scrape_error 1
>> ++                      `,
>> ++              },
>> ++              {
>> ++                      name: "arbitrary node metrics",
>> ++                      summary: &statsapi.Summary{
>> ++                              Node: statsapi.NodeStats{
>> ++                                      CPU: &statsapi.CPUStats{
>> ++                                              Time:                 testTime,
>> ++                                              UsageCoreNanoSeconds: uint64Ptr(10000000000),
>> ++                                      },
>> ++                                      Memory: &statsapi.MemoryStats{
>> ++                                              Time:            testTime,
>> ++                                              WorkingSetBytes: uint64Ptr(1000),
>> ++                                      },
>> ++                              },
>> ++                      },
>> ++                      summaryErr: nil,
>> ++                      expectedMetrics: `
>> ++                              # HELP node_cpu_usage_seconds [ALPHA] Cumulative cpu time consumed by the node in core-seconds
>> ++                              # TYPE node_cpu_usage_seconds gauge
>> ++                              node_cpu_usage_seconds 10 2000
>> ++                              # HELP node_memory_working_set_bytes [ALPHA] Current working set of the node in bytes
>> ++                              # TYPE node_memory_working_set_bytes gauge
>> ++                              node_memory_working_set_bytes 1000 2000
>> ++                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
>> ++                              # TYPE scrape_error gauge
>> ++                              scrape_error 0
>> ++                      `,
>> ++              },
>> ++              {
>> ++                      name: "arbitrary container metrics for different container, pods and namespaces",
>> ++                      summary: &statsapi.Summary{
>> ++                              Pods: []statsapi.PodStats{
>> ++                                      {
>> ++                                              PodRef: statsapi.PodReference{
>> ++                                                      Name:      "pod_a",
>> ++                                                      Namespace: "namespace_a",
>> ++                                              },
>> ++                                              Containers: []statsapi.ContainerStats{
>> ++                                                      {
>> ++                                                              Name: "container_a",
>> ++                                                              CPU: &statsapi.CPUStats{
>> ++                                                                      Time:                 testTime,
>> ++                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
>> ++                                                              },
>> ++                                                              Memory: &statsapi.MemoryStats{
>> ++                                                                      Time:            testTime,
>> ++                                                                      WorkingSetBytes: uint64Ptr(1000),
>> ++                                                              },
>> ++                                                      },
>> ++                                                      {
>> ++                                                              Name: "container_b",
>> ++                                                              CPU: &statsapi.CPUStats{
>> ++                                                                      Time:                 testTime,
>> ++                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
>> ++                                                              },
>> ++                                                              Memory: &statsapi.MemoryStats{
>> ++                                                                      Time:            testTime,
>> ++                                                                      WorkingSetBytes: uint64Ptr(1000),
>> ++                                                              },
>> ++                                                      },
>> ++                                              },
>> ++                                      },
>> ++                                      {
>> ++                                              PodRef: statsapi.PodReference{
>> ++                                                      Name:      "pod_b",
>> ++                                                      Namespace: "namespace_b",
>> ++                                              },
>> ++                                              Containers: []statsapi.ContainerStats{
>> ++                                                      {
>> ++                                                              Name: "container_a",
>> ++                                                              CPU: &statsapi.CPUStats{
>> ++                                                                      Time:                 testTime,
>> ++                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
>> ++                                                              },
>> ++                                                              Memory: &statsapi.MemoryStats{
>> ++                                                                      Time:            testTime,
>> ++                                                                      WorkingSetBytes: uint64Ptr(1000),
>> ++                                                              },
>> ++                                                      },
>> ++                                              },
>> ++                                      },
>> ++                              },
>> ++                      },
>> ++                      summaryErr: nil,
>> ++                      expectedMetrics: `
>> ++                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
>> ++                              # TYPE scrape_error gauge
>> ++                              scrape_error 0
>> ++                              # HELP container_cpu_usage_seconds [ALPHA] Cumulative cpu time consumed by the container in core-seconds
>> ++                              # TYPE container_cpu_usage_seconds gauge
>> ++                              container_cpu_usage_seconds{container="container_a",namespace="namespace_a",pod="pod_a"} 10 2000
>> ++                              container_cpu_usage_seconds{container="container_a",namespace="namespace_b",pod="pod_b"} 10 2000
>> ++                              container_cpu_usage_seconds{container="container_b",namespace="namespace_a",pod="pod_a"} 10 2000
>> ++                              # HELP container_memory_working_set_bytes [ALPHA] Current working set of the container in bytes
>> ++                              # TYPE container_memory_working_set_bytes gauge
>> ++                              container_memory_working_set_bytes{container="container_a",namespace="namespace_a",pod="pod_a"} 1000 2000
>> ++                              container_memory_working_set_bytes{container="container_a",namespace="namespace_b",pod="pod_b"} 1000 2000
>> ++                              container_memory_working_set_bytes{container="container_b",namespace="namespace_a",pod="pod_a"} 1000 2000
>> ++                      `,
>> ++              },
>> ++      }
>> ++
>> ++      for _, test := range tests {
>> ++              tc := test
>> ++              t.Run(tc.name, func(t *testing.T) {
>> ++                      provider := &mockSummaryProvider{}
>> ++                      provider.On("GetCPUAndMemoryStats").Return(tc.summary, tc.summaryErr)
>> ++                      collector := NewResourceMetricsCollector(provider)
>> ++
>> ++                      if err := testutil.CustomCollectAndCompare(collector, strings.NewReader(tc.expectedMetrics), interestedMetrics...); err != nil {
>> ++                              t.Fatal(err)
>> ++                      }
>> ++              })
>> ++      }
>> ++}
>> ++
>> ++func uint64Ptr(u uint64) *uint64 {
>> ++      return &u
>> ++}
>> +diff --git a/src/import/pkg/kubelet/server/auth_test.go b/src/import/pkg/kubelet/server/auth_test.go
>> +index d598bc3892b..638f3ba2bf0 100644
>> +--- a/src/import/pkg/kubelet/server/auth_test.go
>> ++++ b/src/import/pkg/kubelet/server/auth_test.go
>> +@@ -128,6 +128,7 @@ func AuthzTestCases() []AuthzTestCase {
>> +               "/metrics/cadvisor":                   "metrics",
>> +               "/metrics/probes":                     "metrics",
>> +               "/metrics/resource/v1alpha1":          "metrics",
>> ++              "/metrics/resource":                   "metrics",
>> +               "/pods/":                              "proxy",
>> +               "/portForward/{podNamespace}/{podID}": "proxy",
>> +               "/portForward/{podNamespace}/{podID}/{uid}":         "proxy",
>> +diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/kubelet/server/server.go
>> +index 87f3bd28a25..74eeaf10171 100644
>> +--- a/src/import/pkg/kubelet/server/server.go
>> ++++ b/src/import/pkg/kubelet/server/server.go
>> +@@ -38,6 +38,7 @@ import (
>> +       "github.com/google/cadvisor/metrics"
>> +       "google.golang.org/grpc"
>> +       "k8s.io/klog"
>> ++      "k8s.io/kubernetes/pkg/kubelet/metrics/collectors"
>> +
>> +       "k8s.io/api/core/v1"
>> +       metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
>> +@@ -74,13 +75,13 @@ import (
>> + )
>> +
>> + const (
>> +-      metricsPath               = "/metrics"
>> +-      cadvisorMetricsPath       = "/metrics/cadvisor"
>> +-      resourceMetricsPathPrefix = "/metrics/resource"
>> +-      proberMetricsPath         = "/metrics/probes"
>> +-      specPath                  = "/spec/"
>> +-      statsPath                 = "/stats/"
>> +-      logsPath                  = "/logs/"
>> ++      metricsPath         = "/metrics"
>> ++      cadvisorMetricsPath = "/metrics/cadvisor"
>> ++      resourceMetricsPath = "/metrics/resource"
>> ++      proberMetricsPath   = "/metrics/probes"
>> ++      specPath            = "/spec/"
>> ++      statsPath           = "/stats/"
>> ++      logsPath            = "/logs/"
>> + )
>> +
>> + // Server is a http.Handler which exposes kubelet functionality over HTTP.
>> +@@ -321,10 +322,16 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
>> +
>> +       v1alpha1ResourceRegistry := compbasemetrics.NewKubeRegistry()
>> +       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusResourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
>> +-      s.restfulCont.Handle(path.Join(resourceMetricsPathPrefix, v1alpha1.Version),
>> ++      s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Version),
>> +               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
>> +       )
>> +
>> ++      resourceRegistry := compbasemetrics.NewKubeRegistry()
>> ++      resourceRegistry.CustomMustRegister(collectors.NewResourceMetricsCollector(s.resourceAnalyzer))
>> ++      s.restfulCont.Handle(resourceMetricsPath,
>> ++              compbasemetrics.HandlerFor(resourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
>> ++      )
>> ++
>> +       // prober metrics are exposed under a different endpoint
>> +
>> +       p := compbasemetrics.NewKubeRegistry()
>> +--
>> +2.20.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch b/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
>> new file mode 100644
>> index 0000000..f7a5c7c
>> --- /dev/null
>> +++ b/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
>> @@ -0,0 +1,60 @@
>> +From c394d821fdafd719619eb63fcd1065a95ec02ef9 Mon Sep 17 00:00:00 2001
>> +From: RainbowMango <renhongcai@huawei.com>
>> +Date: Sun, 15 Dec 2019 18:37:38 +0800
>> +Subject: [PATCH] Deal with auto-generated files: - Update bazel by
>> + hack/update-bazel.sh
>> +
>> +This commit is needed for context to fix CVE-2020-8551
>> +
>> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pull/86282/commits/c394d821fdafd719619eb63fcd1065a95ec02ef9]
>> +CVE: CVE-2020-8551
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + pkg/kubelet/metrics/collectors/BUILD | 3 +++
>> + pkg/kubelet/server/BUILD             | 1 +
>> + 2 files changed, 4 insertions(+)
>> +
>> +diff --git a/src/import/pkg/kubelet/metrics/collectors/BUILD b/src/import/pkg/kubelet/metrics/collectors/BUILD
>> +index 00bc335320f..25398793eab 100644
>> +--- a/src/import/pkg/kubelet/metrics/collectors/BUILD
>> ++++ b/src/import/pkg/kubelet/metrics/collectors/BUILD
>> +@@ -4,6 +4,7 @@ go_library(
>> +     name = "go_default_library",
>> +     srcs = [
>> +         "log_metrics.go",
>> ++        "resource_metrics.go",
>> +         "volume_stats.go",
>> +     ],
>> +     importpath = "k8s.io/kubernetes/pkg/kubelet/metrics/collectors",
>> +@@ -22,6 +23,7 @@ go_test(
>> +     name = "go_default_test",
>> +     srcs = [
>> +         "log_metrics_test.go",
>> ++        "resource_metrics_test.go",
>> +         "volume_stats_test.go",
>> +     ],
>> +     embed = [":go_default_library"],
>> +@@ -30,6 +32,7 @@ go_test(
>> +         "//pkg/kubelet/server/stats/testing:go_default_library",
>> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_default_library",
>> +         "//staging/src/k8s.io/component-base/metrics/testutil:go_default_library",
>> ++        "//vendor/github.com/stretchr/testify/mock:go_default_library",
>> +     ],
>> + )
>> +
>> +diff --git a/src/import/pkg/kubelet/server/BUILD b/src/import/pkg/kubelet/server/BUILD
>> +index d83619fcbe5..a18f1b5e83b 100644
>> +--- a/src/import/pkg/kubelet/server/BUILD
>> ++++ b/src/import/pkg/kubelet/server/BUILD
>> +@@ -22,6 +22,7 @@ go_library(
>> +         "//pkg/kubelet/apis/podresources/v1alpha1:go_default_library",
>> +         "//pkg/kubelet/apis/resourcemetrics/v1alpha1:go_default_library",
>> +         "//pkg/kubelet/container:go_default_library",
>> ++        "//pkg/kubelet/metrics/collectors:go_default_library",
>> +         "//pkg/kubelet/prober:go_default_library",
>> +         "//pkg/kubelet/server/metrics:go_default_library",
>> +         "//pkg/kubelet/server/portforward:go_default_library",
>> +--
>> +2.20.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch b/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
>> new file mode 100644
>> index 0000000..d4bf783
>> --- /dev/null
>> +++ b/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
>> @@ -0,0 +1,171 @@
>> +From a657089732c0bd5d4515fb9208182c31c6c05790 Mon Sep 17 00:00:00 2001
>> +From: Han Kang <hankang@google.com>
>> +Date: Wed, 29 Jan 2020 12:25:55 -0800
>> +Subject: [PATCH] remove client label from apiserver request count metric since
>> + it is unbounded
>> +
>> +Change-Id: I3a9eacebc9d9dc9ed6347260d9378cdcb5743431
>> +
>> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pull/87669/commits/cc3190968b1f14ddf4067abef849fc41bd6068dc]
>> +CVE: CVE-2020-8552
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + .../apiserver/pkg/endpoints/metrics/BUILD     |  8 ---
>> + .../pkg/endpoints/metrics/metrics.go          | 23 ++------
>> + .../pkg/endpoints/metrics/metrics_test.go     | 54 -------------------
>> + 3 files changed, 4 insertions(+), 81 deletions(-)
>> + delete mode 100644 staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
>> +
>> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
>> +index 8d13a34eadc..8abb3d1a611 100644
>> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
>> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
>> +@@ -3,13 +3,6 @@ package(default_visibility = ["//visibility:public"])
>> + load(
>> +     "@io_bazel_rules_go//go:def.bzl",
>> +     "go_library",
>> +-    "go_test",
>> +-)
>> +-
>> +-go_test(
>> +-    name = "go_default_test",
>> +-    srcs = ["metrics_test.go"],
>> +-    embed = [":go_default_library"],
>> + )
>> +
>> + go_library(
>> +@@ -20,7 +13,6 @@ go_library(
>> +     deps = [
>> +         "//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1/validation:go_default_library",
>> +         "//staging/src/k8s.io/apimachinery/pkg/types:go_default_library",
>> +-        "//staging/src/k8s.io/apimachinery/pkg/util/net:go_default_library",
>> +         "//staging/src/k8s.io/apimachinery/pkg/util/sets:go_default_library",
>> +         "//staging/src/k8s.io/apiserver/pkg/endpoints/request:go_default_library",
>> +         "//staging/src/k8s.io/apiserver/pkg/features:go_default_library",
>> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
>> +index 36ff861da7a..81a9a2c5e6f 100644
>> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
>> ++++ b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
>> +@@ -31,7 +31,6 @@ import (
>> +
>> +       "k8s.io/apimachinery/pkg/apis/meta/v1/validation"
>> +       "k8s.io/apimachinery/pkg/types"
>> +-      utilnet "k8s.io/apimachinery/pkg/util/net"
>> +       utilsets "k8s.io/apimachinery/pkg/util/sets"
>> +       "k8s.io/apiserver/pkg/endpoints/request"
>> +       "k8s.io/apiserver/pkg/features"
>> +@@ -65,14 +64,14 @@ var (
>> +       requestCounter = compbasemetrics.NewCounterVec(
>> +               &compbasemetrics.CounterOpts{
>> +                       Name:           "apiserver_request_total",
>> +-                      Help:           "Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, client, and HTTP response contentType and code.",
>> ++                      Help:           "Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, and HTTP response contentType and code.",
>> +                       StabilityLevel: compbasemetrics.ALPHA,
>> +               },
>> +               // The label_name contentType doesn't follow the label_name convention defined here:
>> +               // https://github.com/kubernetes/community/blob/master/contributors/devel/sig-instrumentation/instrumentation.md
>> +               // But changing it would break backwards compatibility. Future label_names
>> +               // should be all lowercase and separated by underscores.
>> +-              []string{"verb", "dry_run", "group", "version", "resource", "subresource", "scope", "component", "client", "contentType", "code"},
>> ++              []string{"verb", "dry_run", "group", "version", "resource", "subresource", "scope", "component", "contentType", "code"},
>> +       )
>> +       deprecatedRequestCounter = compbasemetrics.NewCounterVec(
>> +               &compbasemetrics.CounterOpts{
>> +@@ -301,11 +300,10 @@ func RecordLongRunning(req *http.Request, requestInfo *request.RequestInfo, comp
>> + func MonitorRequest(req *http.Request, verb, group, version, resource, subresource, scope, component, contentType string, httpCode, respSize int, elapsed time.Duration) {
>> +       reportedVerb := cleanVerb(verb, req)
>> +       dryRun := cleanDryRun(req.URL)
>> +-      client := cleanUserAgent(utilnet.GetHTTPClient(req))
>> +       elapsedMicroseconds := float64(elapsed / time.Microsecond)
>> +       elapsedSeconds := elapsed.Seconds()
>> +-      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
>> +-      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
>> ++      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
>> ++      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
>> +       requestLatencies.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component).Observe(elapsedSeconds)
>> +       deprecatedRequestLatencies.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
>> +       deprecatedRequestLatenciesSummary.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
>> +@@ -425,19 +423,6 @@ func cleanDryRun(u *url.URL) string {
>> +       return strings.Join(utilsets.NewString(dryRun...).List(), ",")
>> + }
>> +
>> +-func cleanUserAgent(ua string) string {
>> +-      // We collapse all "web browser"-type user agents into one "browser" to reduce metric cardinality.
>> +-      if strings.HasPrefix(ua, "Mozilla/") {
>> +-              return "Browser"
>> +-      }
>> +-      // If an old "kubectl.exe" has passed us its full path, we discard the path portion.
>> +-      if kubectlExeRegexp.MatchString(ua) {
>> +-              // avoid an allocation
>> +-              ua = kubectlExeRegexp.ReplaceAllString(ua, "$1")
>> +-      }
>> +-      return ua
>> +-}
>> +-
>> + // ResponseWriterDelegator interface wraps http.ResponseWriter to additionally record content-length, status-code, etc.
>> + type ResponseWriterDelegator struct {
>> +       http.ResponseWriter
>> +diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
>> +deleted file mode 100644
>> +index 4c0a8aa5d27..00000000000
>> +--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
>> ++++ /dev/null
>> +@@ -1,54 +0,0 @@
>> +-/*
>> +-Copyright 2015 The Kubernetes Authors.
>> +-
>> +-Licensed under the Apache License, Version 2.0 (the "License");
>> +-you may not use this file except in compliance with the License.
>> +-You may obtain a copy of the License at
>> +-
>> +-    http://www.apache.org/licenses/LICENSE-2.0
>> +-
>> +-Unless required by applicable law or agreed to in writing, software
>> +-distributed under the License is distributed on an "AS IS" BASIS,
>> +-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>> +-See the License for the specific language governing permissions and
>> +-limitations under the License.
>> +-*/
>> +-
>> +-package metrics
>> +-
>> +-import "testing"
>> +-
>> +-func TestCleanUserAgent(t *testing.T) {
>> +-      panicBuf := []byte{198, 73, 129, 133, 90, 216, 104, 29, 13, 134, 209, 233, 30, 0, 22}
>> +-
>> +-      for _, tc := range []struct {
>> +-              In  string
>> +-              Out string
>> +-      }{
>> +-              {
>> +-                      In:  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36",
>> +-                      Out: "Browser",
>> +-              },
>> +-              {
>> +-                      In:  "kubectl/v1.2.4",
>> +-                      Out: "kubectl/v1.2.4",
>> +-              },
>> +-              {
>> +-                      In:  `C:\Users\Kubernetes\kubectl.exe/v1.5.4`,
>> +-                      Out: "kubectl.exe/v1.5.4",
>> +-              },
>> +-              {
>> +-                      In:  `C:\Program Files\kubectl.exe/v1.5.4`,
>> +-                      Out: "kubectl.exe/v1.5.4",
>> +-              },
>> +-              {
>> +-                      // This malicious input courtesy of enisoc.
>> +-                      In:  string(panicBuf) + "kubectl.exe",
>> +-                      Out: "kubectl.exe",
>> +-              },
>> +-      } {
>> +-              if cleanUserAgent(tc.In) != tc.Out {
>> +-                      t.Errorf("Failed to clean User-Agent: %s", tc.In)
>> +-              }
>> +-      }
>> +-}
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch b/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch
>> new file mode 100644
>> index 0000000..2688797
>> --- /dev/null
>> +++ b/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch
>> @@ -0,0 +1,825 @@
>> +From a290fe55cb2f4593eb4ec5bf410cd77b9d925464 Mon Sep 17 00:00:00 2001
>> +From: CJ Cullen <cjcullen@google.com>
>> +Date: Wed, 22 Jan 2020 11:32:39 -0800
>> +Subject: [PATCH] update gopkg.in/yaml.v2 to v2.2.8
>> +
>> +Upstream Status: Backport [https://github.com/kubernetes/kubernetes/pull/87637/commits/a290fe55cb2f4593eb4ec5bf410cd77b9d925464]
>> +CVE: CVE-2019-11254
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + go.mod                                        |   4 +-
>> + go.sum                                        |   4 +-
>> + staging/src/k8s.io/api/go.sum                 |   4 +-
>> + .../src/k8s.io/apiextensions-apiserver/go.mod |   2 +-
>> + .../src/k8s.io/apiextensions-apiserver/go.sum |   2 +
>> + staging/src/k8s.io/apimachinery/go.mod        |   2 +-
>> + staging/src/k8s.io/apimachinery/go.sum        |   4 +-
>> + staging/src/k8s.io/apiserver/go.mod           |   2 +-
>> + staging/src/k8s.io/apiserver/go.sum           |   4 +-
>> + staging/src/k8s.io/cli-runtime/go.sum         |   4 +-
>> + staging/src/k8s.io/client-go/go.sum           |   4 +-
>> + staging/src/k8s.io/cloud-provider/go.sum      |   4 +-
>> + staging/src/k8s.io/cluster-bootstrap/go.sum   |   4 +-
>> + staging/src/k8s.io/code-generator/go.mod      |   2 +-
>> + staging/src/k8s.io/code-generator/go.sum      |   4 +-
>> + staging/src/k8s.io/component-base/go.sum      |   4 +-
>> + staging/src/k8s.io/cri-api/go.mod             |   2 +-
>> + staging/src/k8s.io/cri-api/go.sum             |   4 +-
>> + staging/src/k8s.io/csi-translation-lib/go.sum |   4 +-
>> + staging/src/k8s.io/kube-aggregator/go.sum     |   4 +-
>> + .../src/k8s.io/kube-controller-manager/go.sum |   4 +-
>> + staging/src/k8s.io/kube-proxy/go.sum          |   4 +-
>> + staging/src/k8s.io/kube-scheduler/go.sum      |   4 +-
>> + staging/src/k8s.io/kubectl/go.mod             |   2 +-
>> + staging/src/k8s.io/kubectl/go.sum             |   4 +-
>> + staging/src/k8s.io/kubelet/go.sum             |   4 +-
>> + .../src/k8s.io/legacy-cloud-providers/go.sum  |   4 +-
>> + staging/src/k8s.io/metrics/go.sum             |   4 +-
>> + staging/src/k8s.io/node-api/go.sum            |   4 +-
>> + staging/src/k8s.io/sample-apiserver/go.sum    |   4 +-
>> + staging/src/k8s.io/sample-cli-plugin/go.sum   |   4 +-
>> + staging/src/k8s.io/sample-controller/go.sum   |   4 +-
>> + vendor/gopkg.in/yaml.v2/.travis.yml           |  18 +--
>> + vendor/gopkg.in/yaml.v2/decode.go             |  14 ++-
>> + vendor/gopkg.in/yaml.v2/scannerc.go           | 107 +++++++++---------
>> + vendor/gopkg.in/yaml.v2/yaml.go               |   2 +-
>> + vendor/gopkg.in/yaml.v2/yamlh.go              |   1 +
>> + vendor/modules.txt                            |   2 +-
>> + 38 files changed, 133 insertions(+), 125 deletions(-)
>> +
>> +diff --git a/src/import/go.mod b/src/import/go.mod
>> +index 7d515c2ffb0..28de082aa0d 100644
>> +--- a/src/import/go.mod
>> ++++ b/src/import/go.mod
>> +@@ -131,7 +131,7 @@ require (
>> +       google.golang.org/grpc v1.23.1
>> +       gopkg.in/gcfg.v1 v1.2.0
>> +       gopkg.in/square/go-jose.v2 v2.2.2
>> +-      gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 v2.2.8
>> +       gotest.tools v2.2.0+incompatible
>> +       gotest.tools/gotestsum v0.3.5
>> +       honnef.co/go/tools v0.0.1-2019.2.2
>> +@@ -518,7 +518,7 @@ replace (
>> +       gopkg.in/square/go-jose.v2 => gopkg.in/square/go-jose.v2 v2.2.2
>> +       gopkg.in/tomb.v1 => gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7
>> +       gopkg.in/warnings.v0 => gopkg.in/warnings.v0 v0.1.1
>> +-      gopkg.in/yaml.v2 => gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 => gopkg.in/yaml.v2 v2.2.8
>> +       gotest.tools => gotest.tools v2.2.0+incompatible
>> +       gotest.tools/gotestsum => gotest.tools/gotestsum v0.3.5
>> +       grpc.go4.org => grpc.go4.org v0.0.0-20170609214715-11d0a25b4919
>> +diff --git a/src/import/go.sum b/src/import/go.sum
>> +index 72d79cb27b2..43aaee0e578 100644
>> +--- a/src/import/go.sum
>> ++++ b/src/import/go.sum
>> +@@ -574,8 +574,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 h1:uRGJdciOHaEIrze2W8Q3AKkep
>> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=
>> + gopkg.in/warnings.v0 v0.1.1 h1:XM28wIgFzaBmeZ5dNHIpWLQpt/9DGKxk+rCg/22nnYE=
>> + gopkg.in/warnings.v0 v0.1.1/go.mod h1:jksf8JmL6Qr/oQM2OXTHunEvvTAsrWBLb6OOjuVWRNI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM+P5UIEo=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + gotest.tools/gotestsum v0.3.5 h1:VePOWRsuWFYpfp/G8mbmOZKxO5T3501SEGQRUdvq7h0=
>> +diff --git a/src/import/staging/src/k8s.io/api/go.sum b/src/importsrc/import/staging/src/k8s.io/api/go.sum
>> +index 08ad9edc62a..73199a7c13e 100644
>> +--- a/src/import/staging/src/k8s.io/api/go.sum
>> ++++ b/src/import/staging/src/k8s.io/api/go.sum
>> +@@ -95,8 +95,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
>> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
>> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=
>> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod b/src/importsrc/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
>> +index 97014a76a68..499daf4ffa7 100644
>> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
>> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
>> +@@ -20,7 +20,7 @@ require (
>> +       github.com/stretchr/testify v1.4.0
>> +       go.etcd.io/etcd v0.0.0-20191023171146-3cf2f69b5738
>> +       google.golang.org/grpc v1.23.1
>> +-      gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 v2.2.8
>> +       k8s.io/api v0.0.0
>> +       k8s.io/apimachinery v0.0.0
>> +       k8s.io/apiserver v0.0.0
>> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum b/src/importstaging/src/k8s.io/apiextensions-apiserver/go.sum
>> +index 6f8bd4918ce..ef6973e4220 100644
>> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
>> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
>> +@@ -449,6 +449,8 @@ gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> + gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.mod b/src/importstaging/src/k8s.io/apimachinery/go.mod
>> +index 85bd7edfc84..569aa8941c4 100644
>> +--- a/src/import/staging/src/k8s.io/apimachinery/go.mod
>> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.mod
>> +@@ -30,7 +30,7 @@ require (
>> +       golang.org/x/text v0.3.2 // indirect
>> +       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
>> +       gopkg.in/inf.v0 v0.9.1
>> +-      gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 v2.2.8
>> +       k8s.io/klog v1.0.0
>> +       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
>> +       sigs.k8s.io/yaml v1.1.0
>> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.sum b/src/importstaging/src/k8s.io/apimachinery/go.sum
>> +index 52ad8335f42..0741a85da3f 100644
>> +--- a/src/import/staging/src/k8s.io/apimachinery/go.sum
>> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.sum
>> +@@ -111,8 +111,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
>> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
>> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=
>> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.mod b/src/importstaging/src/k8s.io/apiserver/go.mod
>> +index 01b925bab48..6586e6680cb 100644
>> +--- a/src/import/staging/src/k8s.io/apiserver/go.mod
>> ++++ b/src/import/staging/src/k8s.io/apiserver/go.mod
>> +@@ -42,7 +42,7 @@ require (
>> +       google.golang.org/grpc v1.23.1
>> +       gopkg.in/natefinch/lumberjack.v2 v2.0.0
>> +       gopkg.in/square/go-jose.v2 v2.2.2
>> +-      gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 v2.2.8
>> +       gotest.tools v2.2.0+incompatible // indirect
>> +       k8s.io/api v0.0.0
>> +       k8s.io/apimachinery v0.0.0
>> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.sum b/src/importstaging/src/k8s.io/apiserver/go.sum
>> +index a9014243b34..0b216e592e4 100644
>> +--- a/src/import/staging/src/k8s.io/apiserver/go.sum
>> ++++ b/src/import/staging/src/k8s.io/apiserver/go.sum
>> +@@ -345,8 +345,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM+P5UIEo=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/cli-runtime/go.sum b/src/importstaging/src/k8s.io/cli-runtime/go.sum
>> +index a5eef73070b..c6c2d0d9231 100644
>> +--- a/src/import/staging/src/k8s.io/cli-runtime/go.sum
>> ++++ b/src/import/staging/src/k8s.io/cli-runtime/go.sum
>> +@@ -234,8 +234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/client-go/go.sum b/src/importstaging/src/k8s.io/client-go/go.sum
>> +index d0df7473b3e..f8f205a69d7 100644
>> +--- a/src/import/staging/src/k8s.io/client-go/go.sum
>> ++++ b/src/import/staging/src/k8s.io/client-go/go.sum
>> +@@ -189,8 +189,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/cloud-provider/go.sum b/src/importstaging/src/k8s.io/cloud-provider/go.sum
>> +index 8ccf452dc8d..74228199881 100644
>> +--- a/src/import/staging/src/k8s.io/cloud-provider/go.sum
>> ++++ b/src/import/staging/src/k8s.io/cloud-provider/go.sum
>> +@@ -171,8 +171,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum b/src/importstaging/src/k8s.io/cluster-bootstrap/go.sum
>> +index 8d81d0563ea..4c58905c7d8 100644
>> +--- a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
>> ++++ b/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
>> +@@ -99,8 +99,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
>> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
>> + k8s.io/klog v1.0.0 h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=
>> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.mod b/src/importstaging/src/k8s.io/code-generator/go.mod
>> +index 69a9e1cd9f2..2436804e8f0 100644
>> +--- a/src/import/staging/src/k8s.io/code-generator/go.mod
>> ++++ b/src/import/staging/src/k8s.io/code-generator/go.mod
>> +@@ -18,7 +18,7 @@ require (
>> +       golang.org/x/tools v0.0.0-20190920225731-5eefd052ad72 // indirect
>> +       gonum.org/v1/gonum v0.0.0-20190331200053-3d26580ed485
>> +       gonum.org/v1/netlib v0.0.0-20190331212654-76723241ea4e // indirect
>> +-      gopkg.in/yaml.v2 v2.2.4 // indirect
>> ++      gopkg.in/yaml.v2 v2.2.8 // indirect
>> +       k8s.io/gengo v0.0.0-20190822140433-26a664648505
>> +       k8s.io/klog v1.0.0
>> +       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
>> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.sum b/src/importstaging/src/k8s.io/code-generator/go.sum
>> +index 7bab2c9efd3..afc21aae562 100644
>> +--- a/src/import/staging/src/k8s.io/code-generator/go.sum
>> ++++ b/src/import/staging/src/k8s.io/code-generator/go.sum
>> +@@ -114,8 +114,8 @@ gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod h1:Co6ibVJAznAaIkqp8
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> + k8s.io/gengo v0.0.0-20190822140433-26a664648505 h1:ZY6yclUKVbZ+SdWnkfY+Je5vrMpKOxmGeKRbsXVmqYM=
>> +diff --git a/src/import/staging/src/k8s.io/component-base/go.sum b/src/importstaging/src/k8s.io/component-base/go.sum
>> +index b6af501ac2e..6c54e8b74e0 100644
>> +--- a/src/import/staging/src/k8s.io/component-base/go.sum
>> ++++ b/src/import/staging/src/k8s.io/component-base/go.sum
>> +@@ -210,8 +210,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/cri-api/go.mod b/src/importstaging/src/k8s.io/cri-api/go.mod
>> +index de2050e54af..4f8315dcfcc 100644
>> +--- a/src/import/staging/src/k8s.io/cri-api/go.mod
>> ++++ b/src/import/staging/src/k8s.io/cri-api/go.mod
>> +@@ -16,7 +16,7 @@ require (
>> +       google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873 // indirect
>> +       google.golang.org/grpc v1.23.1
>> +       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
>> +-      gopkg.in/yaml.v2 v2.2.4 // indirect
>> ++      gopkg.in/yaml.v2 v2.2.8 // indirect
>> + )
>> +
>> + replace (
>> +diff --git a/src/import/staging/src/k8s.io/cri-api/go.sum b/src/importstaging/src/k8s.io/cri-api/go.sum
>> +index 880169cf1dc..5340741af79 100644
>> +--- a/src/import/staging/src/k8s.io/cri-api/go.sum
>> ++++ b/src/import/staging/src/k8s.io/cri-api/go.sum
>> +@@ -59,7 +59,7 @@ gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8
>> + gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 h1:qIbj1fsPNlZgppZ+VLlY7N33q108Sa+fhmuc+sWQYwY=
>> + gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum b/src/importstaging/src/k8s.io/csi-translation-lib/go.sum
>> +index 2cb7a51b2a4..f918afd9078 100644
>> +--- a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
>> ++++ b/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
>> +@@ -154,8 +154,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/kube-aggregator/go.sum b/src/importstaging/src/k8s.io/kube-aggregator/go.sum
>> +index bfcd7b4aa8a..d29c2136442 100644
>> +--- a/src/import/staging/src/k8s.io/kube-aggregator/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kube-aggregator/go.sum
>> +@@ -378,8 +378,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum b/src/importstaging/src/k8s.io/kube-controller-manager/go.sum
>> +index 5303a3606b3..b238ae9cbbb 100644
>> +--- a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
>> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/kube-proxy/go.sum b/src/importstaging/src/k8s.io/kube-proxy/go.sum
>> +index 5303a3606b3..b238ae9cbbb 100644
>> +--- a/src/import/staging/src/k8s.io/kube-proxy/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kube-proxy/go.sum
>> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/kube-scheduler/go.sum b/src/importstaging/src/k8s.io/kube-scheduler/go.sum
>> +index 5303a3606b3..b238ae9cbbb 100644
>> +--- a/src/import/staging/src/k8s.io/kube-scheduler/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kube-scheduler/go.sum
>> +@@ -184,8 +184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.mod b/src/importstaging/src/k8s.io/kubectl/go.mod
>> +index e0111ac16bf..c646296ebb1 100644
>> +--- a/src/import/staging/src/k8s.io/kubectl/go.mod
>> ++++ b/src/import/staging/src/k8s.io/kubectl/go.mod
>> +@@ -34,7 +34,7 @@ require (
>> +       github.com/stretchr/testify v1.4.0
>> +       github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1 // indirect
>> +       golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456
>> +-      gopkg.in/yaml.v2 v2.2.4
>> ++      gopkg.in/yaml.v2 v2.2.8
>> +       gotest.tools v2.2.0+incompatible // indirect
>> +       k8s.io/api v0.0.0
>> +       k8s.io/apimachinery v0.0.0
>> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.sum b/src/importstaging/src/k8s.io/kubectl/go.sum
>> +index 95ba529852c..1db9943f53c 100644
>> +--- a/src/import/staging/src/k8s.io/kubectl/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kubectl/go.sum
>> +@@ -317,8 +317,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM+P5UIEo=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/kubelet/go.sum b/src/importstaging/src/k8s.io/kubelet/go.sum
>> +index f42a61078c9..57a0c633583 100644
>> +--- a/src/import/staging/src/k8s.io/kubelet/go.sum
>> ++++ b/src/import/staging/src/k8s.io/kubelet/go.sum
>> +@@ -119,8 +119,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
>> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum b/src/importstaging/src/k8s.io/legacy-cloud-providers/go.sum
>> +index 99f76dac0cc..9e990dff888 100644
>> +--- a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
>> ++++ b/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
>> +@@ -340,8 +340,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/metrics/go.sum b/src/importstaging/src/k8s.io/metrics/go.sum
>> +index 99df273ff9e..d9b2c94fdbe 100644
>> +--- a/src/import/staging/src/k8s.io/metrics/go.sum
>> ++++ b/src/import/staging/src/k8s.io/metrics/go.sum
>> +@@ -211,8 +211,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
>> +diff --git a/src/import/staging/src/k8s.io/node-api/go.sum b/src/importstaging/src/k8s.io/node-api/go.sum
>> +index 77f0a21fa7d..1cb50186d99 100644
>> +--- a/src/import/staging/src/k8s.io/node-api/go.sum
>> ++++ b/src/import/staging/src/k8s.io/node-api/go.sum
>> +@@ -215,8 +215,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
>> +diff --git a/src/import/staging/src/k8s.io/sample-apiserver/go.sum b/src/importstaging/src/k8s.io/sample-apiserver/go.sum
>> +index 3ea72ac63e9..236ee4b1e88 100644
>> +--- a/src/import/staging/src/k8s.io/sample-apiserver/go.sum
>> ++++ b/src/import/staging/src/k8s.io/sample-apiserver/go.sum
>> +@@ -375,8 +375,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sxOXAzmJt81HFBacw=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> +diff --git a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum b/src/importstaging/src/k8s.io/sample-cli-plugin/go.sum
>> +index a5eef73070b..c6c2d0d9231 100644
>> +--- a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
>> ++++ b/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
>> +@@ -234,8 +234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
>> +diff --git a/src/import/staging/src/k8s.io/sample-controller/go.sum b/src/importstaging/src/k8s.io/sample-controller/go.sum
>> +index 55fa85acf16..3b18f34b5a6 100644
>> +--- a/src/import/staging/src/k8s.io/sample-controller/go.sum
>> ++++ b/src/import/staging/src/k8s.io/sample-controller/go.sum
>> +@@ -216,8 +216,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
>> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
>> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
>> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
>> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5A1VGuI=
>> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
>> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
>> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml b/src/importvendor/gopkg.in/yaml.v2/.travis.yml
>> +index 9f556934d8b..055480b9ef8 100644
>> +--- a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
>> ++++ b/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
>> +@@ -1,12 +1,16 @@
>> + language: go
>> +
>> + go:
>> +-    - 1.4
>> +-    - 1.5
>> +-    - 1.6
>> +-    - 1.7
>> +-    - 1.8
>> +-    - 1.9
>> +-    - tip
>> ++    - "1.4.x"
>> ++    - "1.5.x"
>> ++    - "1.6.x"
>> ++    - "1.7.x"
>> ++    - "1.8.x"
>> ++    - "1.9.x"
>> ++    - "1.10.x"
>> ++    - "1.11.x"
>> ++    - "1.12.x"
>> ++    - "1.13.x"
>> ++    - "tip"
>> +
>> + go_import_path: gopkg.in/yaml.v2
>> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/decode.go b/src/importvendor/gopkg.in/yaml.v2/decode.go
>> +index 53108765555..129bc2a97d3 100644
>> +--- a/src/import/vendor/gopkg.in/yaml.v2/decode.go
>> ++++ b/src/import/vendor/gopkg.in/yaml.v2/decode.go
>> +@@ -319,10 +319,14 @@ func (d *decoder) prepare(n *node, out reflect.Value) (newout reflect.Value, unm
>> + }
>> +
>> + const (
>> +-      // 400,000 decode operations is ~500kb of dense object declarations, or ~5kb of dense object declarations with 10000% alias expansion
>> ++      // 400,000 decode operations is ~500kb of dense object declarations, or
>> ++      // ~5kb of dense object declarations with 10000% alias expansion
>> +       alias_ratio_range_low = 400000
>> +-      // 4,000,000 decode operations is ~5MB of dense object declarations, or ~4.5MB of dense object declarations with 10% alias expansion
>> ++
>> ++      // 4,000,000 decode operations is ~5MB of dense object declarations, or
>> ++      // ~4.5MB of dense object declarations with 10% alias expansion
>> +       alias_ratio_range_high = 4000000
>> ++
>> +       // alias_ratio_range is the range over which we scale allowed alias ratios
>> +       alias_ratio_range = float64(alias_ratio_range_high - alias_ratio_range_low)
>> + )
>> +@@ -784,8 +788,7 @@ func (d *decoder) merge(n *node, out reflect.Value) {
>> +       case mappingNode:
>> +               d.unmarshal(n, out)
>> +       case aliasNode:
>> +-              an, ok := d.doc.anchors[n.value]
>> +-              if ok && an.kind != mappingNode {
>> ++              if n.alias != nil && n.alias.kind != mappingNode {
>> +                       failWantMap()
>> +               }
>> +               d.unmarshal(n, out)
>> +@@ -794,8 +797,7 @@ func (d *decoder) merge(n *node, out reflect.Value) {
>> +               for i := len(n.children) - 1; i >= 0; i-- {
>> +                       ni := n.children[i]
>> +                       if ni.kind == aliasNode {
>> +-                              an, ok := d.doc.anchors[ni.value]
>> +-                              if ok && an.kind != mappingNode {
>> ++                              if ni.alias != nil && ni.alias.kind != mappingNode {
>> +                                       failWantMap()
>> +                               }
>> +                       } else if ni.kind != mappingNode {
>> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go b/src/importvendor/gopkg.in/yaml.v2/scannerc.go
>> +index 570b8ecd10f..0b9bb6030a0 100644
>> +--- a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
>> ++++ b/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
>> +@@ -626,31 +626,18 @@ func trace(args ...interface{}) func() {
>> + func yaml_parser_fetch_more_tokens(parser *yaml_parser_t) bool {
>> +       // While we need more tokens to fetch, do it.
>> +       for {
>> +-              // Check if we really need to fetch more tokens.
>> +-              need_more_tokens := false
>> +-
>> +-              if parser.tokens_head == len(parser.tokens) {
>> +-                      // Queue is empty.
>> +-                      need_more_tokens = true
>> +-              } else {
>> +-                      // Check if any potential simple key may occupy the head position.
>> +-                      if !yaml_parser_stale_simple_keys(parser) {
>> ++              if parser.tokens_head != len(parser.tokens) {
>> ++                      // If queue is non-empty, check if any potential simple key may
>> ++                      // occupy the head position.
>> ++                      head_tok_idx, ok := parser.simple_keys_by_tok[parser.tokens_parsed]
>> ++                      if !ok {
>> ++                              break
>> ++                      } else if valid, ok := yaml_simple_key_is_valid(parser, &parser.simple_keys[head_tok_idx]); !ok {
>> +                               return false
>> +-                      }
>> +-
>> +-                      for i := range parser.simple_keys {
>> +-                              simple_key := &parser.simple_keys[i]
>> +-                              if simple_key.possible && simple_key.token_number == parser.tokens_parsed {
>> +-                                      need_more_tokens = true
>> +-                                      break
>> +-                              }
>> ++                      } else if !valid {
>> ++                              break
>> +                       }
>> +               }
>> +-
>> +-              // We are finished.
>> +-              if !need_more_tokens {
>> +-                      break
>> +-              }
>> +               // Fetch the next token.
>> +               if !yaml_parser_fetch_next_token(parser) {
>> +                       return false
>> +@@ -678,11 +665,6 @@ func yaml_parser_fetch_next_token(parser *yaml_parser_t) bool {
>> +               return false
>> +       }
>> +
>> +-      // Remove obsolete potential simple keys.
>> +-      if !yaml_parser_stale_simple_keys(parser) {
>> +-              return false
>> +-      }
>> +-
>> +       // Check the indentation level against the current column.
>> +       if !yaml_parser_unroll_indent(parser, parser.mark.column) {
>> +               return false
>> +@@ -837,29 +819,30 @@ func yaml_parser_fetch_next_token(parser *yaml_parser_t) bool {
>> +               "found character that cannot start any token")
>> + }
>> +
>> +-// Check the list of potential simple keys and remove the positions that
>> +-// cannot contain simple keys anymore.
>> +-func yaml_parser_stale_simple_keys(parser *yaml_parser_t) bool {
>> +-      // Check for a potential simple key for each flow level.
>> +-      for i := range parser.simple_keys {
>> +-              simple_key := &parser.simple_keys[i]
>> +-
>> +-              // The specification requires that a simple key
>> +-              //
>> +-              //  - is limited to a single line,
>> +-              //  - is shorter than 1024 characters.
>> +-              if simple_key.possible && (simple_key.mark.line < parser.mark.line || simple_key.mark.index+1024 < parser.mark.index) {
>> +-
>> +-                      // Check if the potential simple key to be removed is required.
>> +-                      if simple_key.required {
>> +-                              return yaml_parser_set_scanner_error(parser,
>> +-                                      "while scanning a simple key", simple_key.mark,
>> +-                                      "could not find expected ':'")
>> +-                      }
>> +-                      simple_key.possible = false
>> ++func yaml_simple_key_is_valid(parser *yaml_parser_t, simple_key *yaml_simple_key_t) (valid, ok bool) {
>> ++      if !simple_key.possible {
>> ++              return false, true
>> ++      }
>> ++
>> ++      // The 1.2 specification says:
>> ++      //
>> ++      //     "If the ? indicator is omitted, parsing needs to see past the
>> ++      //     implicit key to recognize it as such. To limit the amount of
>> ++      //     lookahead required, the “:” indicator must appear at most 1024
>> ++      //     Unicode characters beyond the start of the key. In addition, the key
>> ++      //     is restricted to a single line."
>> ++      //
>> ++      if simple_key.mark.line < parser.mark.line || simple_key.mark.index+1024 < parser.mark.index {
>> ++              // Check if the potential simple key to be removed is required.
>> ++              if simple_key.required {
>> ++                      return false, yaml_parser_set_scanner_error(parser,
>> ++                              "while scanning a simple key", simple_key.mark,
>> ++                              "could not find expected ':'")
>> +               }
>> ++              simple_key.possible = false
>> ++              return false, true
>> +       }
>> +-      return true
>> ++      return true, true
>> + }
>> +
>> + // Check if a simple key may start at the current position and add it if
>> +@@ -879,13 +862,14 @@ func yaml_parser_save_simple_key(parser *yaml_parser_t) bool {
>> +                       possible:     true,
>> +                       required:     required,
>> +                       token_number: parser.tokens_parsed + (len(parser.tokens) - parser.tokens_head),
>> ++                      mark:         parser.mark,
>> +               }
>> +-              simple_key.mark = parser.mark
>> +
>> +               if !yaml_parser_remove_simple_key(parser) {
>> +                       return false
>> +               }
>> +               parser.simple_keys[len(parser.simple_keys)-1] = simple_key
>> ++              parser.simple_keys_by_tok[simple_key.token_number] = len(parser.simple_keys) - 1
>> +       }
>> +       return true
>> + }
>> +@@ -900,9 +884,10 @@ func yaml_parser_remove_simple_key(parser *yaml_parser_t) bool {
>> +                               "while scanning a simple key", parser.simple_keys[i].mark,
>> +                               "could not find expected ':'")
>> +               }
>> ++              // Remove the key from the stack.
>> ++              parser.simple_keys[i].possible = false
>> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[i].token_number)
>> +       }
>> +-      // Remove the key from the stack.
>> +-      parser.simple_keys[i].possible = false
>> +       return true
>> + }
>> +
>> +@@ -912,7 +897,12 @@ const max_flow_level = 10000
>> + // Increase the flow level and resize the simple key list if needed.
>> + func yaml_parser_increase_flow_level(parser *yaml_parser_t) bool {
>> +       // Reset the simple key on the next level.
>> +-      parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{})
>> ++      parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{
>> ++              possible:     false,
>> ++              required:     false,
>> ++              token_number: parser.tokens_parsed + (len(parser.tokens) - parser.tokens_head),
>> ++              mark:         parser.mark,
>> ++      })
>> +
>> +       // Increase the flow level.
>> +       parser.flow_level++
>> +@@ -928,7 +918,9 @@ func yaml_parser_increase_flow_level(parser *yaml_parser_t) bool {
>> + func yaml_parser_decrease_flow_level(parser *yaml_parser_t) bool {
>> +       if parser.flow_level > 0 {
>> +               parser.flow_level--
>> +-              parser.simple_keys = parser.simple_keys[:len(parser.simple_keys)-1]
>> ++              last := len(parser.simple_keys) - 1
>> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[last].token_number)
>> ++              parser.simple_keys = parser.simple_keys[:last]
>> +       }
>> +       return true
>> + }
>> +@@ -1005,6 +997,8 @@ func yaml_parser_fetch_stream_start(parser *yaml_parser_t) bool {
>> +       // Initialize the simple key stack.
>> +       parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{})
>> +
>> ++      parser.simple_keys_by_tok = make(map[int]int)
>> ++
>> +       // A simple key is allowed at the beginning of the stream.
>> +       parser.simple_key_allowed = true
>> +
>> +@@ -1286,7 +1280,11 @@ func yaml_parser_fetch_value(parser *yaml_parser_t) bool {
>> +       simple_key := &parser.simple_keys[len(parser.simple_keys)-1]
>> +
>> +       // Have we found a simple key?
>> +-      if simple_key.possible {
>> ++      if valid, ok := yaml_simple_key_is_valid(parser, simple_key); !ok {
>> ++              return false
>> ++
>> ++      } else if valid {
>> ++
>> +               // Create the KEY token and insert it into the queue.
>> +               token := yaml_token_t{
>> +                       typ:        yaml_KEY_TOKEN,
>> +@@ -1304,6 +1302,7 @@ func yaml_parser_fetch_value(parser *yaml_parser_t) bool {
>> +
>> +               // Remove the simple key.
>> +               simple_key.possible = false
>> ++              delete(parser.simple_keys_by_tok, simple_key.token_number)
>> +
>> +               // A simple key cannot follow another simple key.
>> +               parser.simple_key_allowed = false
>> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yaml.go b/src/importvendor/gopkg.in/yaml.v2/yaml.go
>> +index de85aa4cdb7..89650e293ac 100644
>> +--- a/src/import/vendor/gopkg.in/yaml.v2/yaml.go
>> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yaml.go
>> +@@ -89,7 +89,7 @@ func UnmarshalStrict(in []byte, out interface{}) (err error) {
>> +       return unmarshal(in, out, true)
>> + }
>> +
>> +-// A Decorder reads and decodes YAML values from an input stream.
>> ++// A Decoder reads and decodes YAML values from an input stream.
>> + type Decoder struct {
>> +       strict bool
>> +       parser *parser
>> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go b/src/importvendor/gopkg.in/yaml.v2/yamlh.go
>> +index e25cee563be..f6a9c8e34b1 100644
>> +--- a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
>> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
>> +@@ -579,6 +579,7 @@ type yaml_parser_t struct {
>> +
>> +       simple_key_allowed bool                // May a simple key occur at the current position?
>> +       simple_keys        []yaml_simple_key_t // The stack of simple keys.
>> ++      simple_keys_by_tok map[int]int         // possible simple_key indexes indexed by token_number
>> +
>> +       // Parser stuff
>> +
>> +diff --git a/src/import/vendor/modules.txt b/src/importvendor/modules.txt
>> +index a51796d1ed5..a45f1cd3e3b 100644
>> +--- a/src/import/vendor/modules.txt
>> ++++ b/src/import/vendor/modules.txt
>> +@@ -1059,7 +1059,7 @@ gopkg.in/square/go-jose.v2/jwt
>> + gopkg.in/tomb.v1
>> + # gopkg.in/warnings.v0 v0.1.1 => gopkg.in/warnings.v0 v0.1.1
>> + gopkg.in/warnings.v0
>> +-# gopkg.in/yaml.v2 v2.2.4 => gopkg.in/yaml.v2 v2.2.4
>> ++# gopkg.in/yaml.v2 v2.2.8 => gopkg.in/yaml.v2 v2.2.8
>> + gopkg.in/yaml.v2
>> + # gotest.tools v2.2.0+incompatible => gotest.tools v2.2.0+incompatible
>> + gotest.tools
>> +--
>> +2.20.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
>> index 76107af..4698874 100644
>> --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> @@ -11,6 +11,11 @@ SRCREV_kubernetes = "f45fc1861acab22eb6a4697e3fb831e85ef5ff9c"
>>   SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=kubernetes \
>>              file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>>              file://0001-cross-don-t-build-tests-by-default.patch \
>> +           file://0001-Add-new-endpoint-for-resource-metrics.patch \
>> +           file://0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch \
>> +           file://0001-remove-client-label-from-apiserver-request-count-met.patch \
>> +           file://0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch \
>> +           file://0001-Deal-with-auto-generated-files.patch \
>>             "
>>
>>   DEPENDS += "rsync-native \
>> --
>> 2.24.1
>>
>>
>
>
>
> 

--------------01EB55A8D2F3BB3D02E028C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-04-29 3:28 p.m., Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4ObCkP62dLaEj_w1hrWFsB6ANrSPv2uSpd-NGx7g2sY1g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I'm nearly complete on an kubernetes refresh, so I won't merge this
patch to master, and I'm inclined to do the uprev even in dunfell.

If this patch is destined for dunfell, that should indicated clearly
in the patch subject.

Cheers,

Bruce</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Thank you for taking the time to review the changes.</p>
    <p>What version are you refreshing to?</p>
    <p><br>
    </p>
    <p>Sakib<br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4ObCkP62dLaEj_w1hrWFsB6ANrSPv2uSpd-NGx7g2sY1g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

On Wed, Apr 29, 2020 at 1:49 PM <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
CVE: CVE-2020-8551
        - 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1
        - 9802bfcec0580169cffce2a3d468689a407fa7dc
        - c394d821fdafd719619eb63fcd1065a95ec02ef9

CVE: CVE-2020-8552
        - cc3190968b1f14ddf4067abef849fc41bd6068dc

CVE: CVE-2019-11254
        - a290fe55cb2f4593eb4ec5bf410cd77b9d925464

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 ...-to-fix-kubelet-metrics-memory-issue.patch | 313 &#43;&#43;&#43;&#43;&#43;&#43;&#43;
 ...dd-new-endpoint-for-resource-metrics.patch | 440 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../0001-Deal-with-auto-generated-files.patch |  60 &#43;&#43;
 ...bel-from-apiserver-request-count-met.patch | 171 &#43;&#43;&#43;&#43;
 ...01-update-gopkg.in-yaml.v2-to-v2.2.8.patch | 825 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../kubernetes/kubernetes_git.bb              |   5 &#43;
 6 files changed, 1814 insertions(&#43;)
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch

diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch b/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
new file mode 100644
index 0000000..5369f04
--- /dev/null
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes/0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch
@@ -0,0 &#43;1,313 @@
&#43;From 0bf092ccc5fccb06b13afe5da86286a856d96770 Mon Sep 17 00:00:00 2001
&#43;From: Walter Fender <a class="moz-txt-link-rfc2396E" href="mailto:wfender@google.com">&lt;wfender@google.com&gt;</a>
&#43;Date: Thu, 6 Feb 2020 19:10:18 -0800
&#43;Subject: [PATCH] Add code to fix kubelet/metrics memory issue.
&#43;
&#43;Bucketing url paths based on concept/handling.
&#43;Bucketing code placed by handling code to encourage usage.
&#43;Added unit tests.
&#43;Fix format.
&#43;
&#43;Upstream Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/kubernetes/kubernetes/pull/87913/commits/9802bfcec0580169cffce2a3d468689a407fa7dc">https://github.com/kubernetes/kubernetes/pull/87913/commits/9802bfcec0580169cffce2a3d468689a407fa7dc</a>]
&#43;CVE: CVE-2020-8551
&#43;
&#43;Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
&#43;---
&#43; pkg/kubelet/server/server.go      | 57 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
&#43; pkg/kubelet/server/server_test.go | 54 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
&#43; 2 files changed, 106 insertions(&#43;), 5 deletions(-)
&#43;
&#43;diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/kubelet/server/server.go
&#43;index 0f953c92502..05c1dc9c701 100644
&#43;--- a/src/import/pkg/kubelet/server/server.go
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/server/server.go
&#43;@@ -89,6 &#43;89,7 @@ type Server struct {
&#43;       auth                       AuthInterface
&#43;       host                       HostInterface
&#43;       restfulCont                containerInterface
&#43;&#43;      metricsBuckets             map[string]bool
&#43;       resourceAnalyzer           stats.ResourceAnalyzer
&#43;       redirectContainerStreaming bool
&#43; }
&#43;@@ -225,6 &#43;226,7 @@ func NewServer(
&#43;               resourceAnalyzer:           resourceAnalyzer,
&#43;               auth:                       auth,
&#43;               restfulCont:                &amp;filteringContainer{Container: restful.NewContainer()},
&#43;&#43;              metricsBuckets:             make(map[string]bool),
&#43;               redirectContainerStreaming: redirectContainerStreaming,
&#43;       }
&#43;       if auth != nil {
&#43;@@ -280,14 &#43;282,32 @@ func (s *Server) InstallAuthFilter() {
&#43;       })
&#43; }
&#43;
&#43;&#43;// addMetricsBucketMatcher adds a regexp matcher and the relevant bucket to use when
&#43;&#43;// it matches. Please be aware this is not thread safe and should not be used dynamically
&#43;&#43;func (s *Server) addMetricsBucketMatcher(bucket string) {
&#43;&#43;      s.metricsBuckets[bucket] = true
&#43;&#43;}
&#43;&#43;
&#43;&#43;// getMetricBucket find the appropriate metrics reporting bucket for the given path
&#43;&#43;func (s *Server) getMetricBucket(path string) string {
&#43;&#43;      root := getURLRootPath(path)
&#43;&#43;      if s.metricsBuckets[root] == true {
&#43;&#43;              return root
&#43;&#43;      }
&#43;&#43;      return &quot;Invalid path&quot;
&#43;&#43;}
&#43;&#43;
&#43; // InstallDefaultHandlers registers the default set of supported HTTP request
&#43; // patterns with the restful Container.
&#43; func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;&#43;      s.addMetricsBucketMatcher(&quot;healthz&quot;)
&#43;       healthz.InstallHandler(s.restfulCont,
&#43;               healthz.PingHealthz,
&#43;               healthz.LogHealthz,
&#43;               healthz.NamedCheck(&quot;syncloop&quot;, s.syncLoopHealthCheck),
&#43;       )
&#43;&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;pods&quot;)
&#43;       ws := new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/pods&quot;).
&#43;@@ -297,7 &#43;317,14 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;               Operation(&quot;getPods&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;stats&quot;)
&#43;       s.restfulCont.Add(stats.CreateHandlers(statsPath, s.host, s.resourceAnalyzer, enableCAdvisorJSONEndpoints))
&#43;&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/cadvisor&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/probes&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/resource/v1alpha1&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/resource&quot;)
&#43;       //lint:ignore SA1019 <a class="moz-txt-link-freetext" href="https://github.com/kubernetes/enhancements/issues/1206">https://github.com/kubernetes/enhancements/issues/1206</a>
&#43;       s.restfulCont.Handle(metricsPath, legacyregistry.Handler())
&#43;
&#43;@@ -320,12 &#43;347,15 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;               compbasemetrics.HandlerFor(r, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
&#43;       )
&#43;
&#43;&#43;      // deprecated endpoint which will be removed in release 1.20.0&#43;.
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/resource/v1alpha1&quot;)
&#43;       v1alpha1ResourceRegistry := compbasemetrics.NewKubeRegistry()
&#43;       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusResourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
&#43;       s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Version),
&#43;               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
&#43;       )
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/resource&quot;)
&#43;       resourceRegistry := compbasemetrics.NewKubeRegistry()
&#43;       resourceRegistry.CustomMustRegister(collectors.NewResourceMetricsCollector(s.resourceAnalyzer))
&#43;       s.restfulCont.Handle(resourceMetricsPath,
&#43;@@ -334,6 &#43;364,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;
&#43;       // prober metrics are exposed under a different endpoint
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;metrics/probes&quot;)
&#43;       p := compbasemetrics.NewKubeRegistry()
&#43;       compbasemetrics.RegisterProcessStartTime(p.RawRegister)
&#43;       p.MustRegister(prober.ProberResults)
&#43;@@ -341,6 &#43;372,7 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;               compbasemetrics.HandlerFor(p, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
&#43;       )
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;spec&quot;)
&#43;       if enableCAdvisorJSONEndpoints {
&#43;               ws := new(restful.WebService)
&#43;               ws.
&#43;@@ -360,6 &#43;392,7 @@ const pprofBasePath = &quot;/debug/pprof/&quot;
&#43; func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;       klog.Infof(&quot;Adding debug handlers to kubelet server.&quot;)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;run&quot;)
&#43;       ws := new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/run<a class="moz-txt-link-rfc2396E" href="mailto:)&#43;@@-371,6&#43;404,7@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;)
&#43;@@ -371,6 &#43;404,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getRun&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;exec&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/exec<a class="moz-txt-link-rfc2396E" href="mailto:)&#43;@@-388,6&#43;422,7@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;)
&#43;@@ -388,6 &#43;422,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getExec&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;attach&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/attach<a class="moz-txt-link-rfc2396E" href="mailto:)&#43;@@-405,6&#43;440,7@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;)
&#43;@@ -405,6 &#43;440,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getAttach&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;portForward&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/portForward<a class="moz-txt-link-rfc2396E" href="mailto:)&#43;@@-422,6&#43;458,7@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;)
&#43;@@ -422,6 &#43;458,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getPortForward&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;logs&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(logsPath)
&#43;@@ -434,6 &#43;471,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Param(ws.PathParameter(&quot;logpath&quot;, &quot;path to the log&quot;).DataType(&quot;string&quot;)))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;containerLogs&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/containerLogs<a class="moz-txt-link-rfc2396E" href="mailto:)&#43;@@-442,8&#43;480,10@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;)
&#43;@@ -442,8 &#43;480,10 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getContainerLogs&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;configz&quot;)
&#43;       configz.InstallHandler(s.restfulCont)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;debug&quot;)
&#43;       handlePprofEndpoint := func(req *restful.Request, resp *restful.Response) {
&#43;               name := strings.TrimPrefix(req.Request.URL.Path, pprofBasePath)
&#43;               switch name {
&#43;@@ -459,7 &#43;499,6 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;                       pprof.Index(resp, req.Request)
&#43;               }
&#43;       }
&#43;-
&#43;       // Setup pprof handlers.
&#43;       ws = new(restful.WebService).Path(pprofBasePath)
&#43;       ws.Route(ws.GET(&quot;/{subpath:*}&quot;).To(func(req *restful.Request, resp *restful.Response) {
&#43;@@ -472,6 &#43;511,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;       s.restfulCont.Handle(&quot;/debug/flags/v&quot;, routes.StringFlagPutHandler(logs.GlogSetter))
&#43;
&#43;       // The /runningpods endpoint is used for testing only.
&#43;&#43;      s.addMetricsBucketMatcher(&quot;runningpods&quot;)
&#43;       ws = new(restful.WebService)
&#43;       ws.
&#43;               Path(&quot;/runningpods/<a class="moz-txt-link-rfc2396E" href="mailto:).&#43;@@-481,6&#43;521,7@@func(s*Server)InstallDebuggingHandlers(criHandlerhttp.Handler){&#43;Operation(">&quot;).
&#43;@@ -481,6 &#43;521,7 @@ func (s *Server) InstallDebuggingHandlers(criHandler http.Handler) {
&#43;               Operation(&quot;</a>getRunningPods&quot;))
&#43;       s.restfulCont.Add(ws)
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;cri&quot;)
&#43;       if criHandler != nil {
&#43;               s.restfulCont.Handle(&quot;/cri/&quot;, criHandler)
&#43;       }
&#43;@@ -492,6 &#43;533,14 @@ func (s *Server) InstallDebuggingDisabledHandlers() {
&#43;               http.Error(w, &quot;Debug endpoints are disabled.&quot;, http.StatusMethodNotAllowed)
&#43;       })
&#43;
&#43;&#43;      s.addMetricsBucketMatcher(&quot;run&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;exec&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;attach&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;portForward&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;containerLogs&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;runningpods&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;pprof&quot;)
&#43;&#43;      s.addMetricsBucketMatcher(&quot;logs&quot;)
&#43;       paths := []string{
&#43;               &quot;/run/&quot;, &quot;/exec/&quot;, &quot;/attach/&quot;, &quot;/portForward/&quot;, &quot;/containerLogs/&quot;,
&#43;               &quot;/runningpods/&quot;, pprofBasePath, logsPath}
&#43;@@ -808,10 &#43;857,10 @@ func (s *Server) getPortForward(request *restful.Request, response *restful.Resp
&#43;       proxyStream(response.ResponseWriter, request.Request, url)
&#43; }
&#43;
&#43;-// trimURLPath trims a URL path.
&#43;&#43;// getURLRootPath trims a URL path.
&#43; // For paths in the format of &quot;/metrics/xxx&quot;, &quot;metrics/xxx&quot; is returned;
&#43; // For all other paths, the first part of the path is returned.
&#43;-func trimURLPath(path string) string {
&#43;&#43;func getURLRootPath(path string) string {
&#43;       parts := strings.SplitN(strings.TrimPrefix(path, &quot;/&quot;), &quot;/&quot;, 3)
&#43;       if len(parts) == 0 {
&#43;               return path
&#43;@@ -859,7 &#43;908,7 @@ func (s *Server) ServeHTTP(w http.ResponseWriter, req *http.Request) {
&#43;               serverType = &quot;readwrite&quot;
&#43;       }
&#43;
&#43;-      method, path := req.Method, trimURLPath(req.URL.Path)
&#43;&#43;      method, path := req.Method, s.getMetricBucket(req.URL.Path)
&#43;
&#43;       longRunning := strconv.FormatBool(isLongRunningRequest(path))
&#43;
&#43;diff --git a/src/import/pkg/kubelet/server/server_test.go b/src/import/pkg/kubelet/server/server_test.go
&#43;index eba788b50ea..5e6a1cc0588 100644
&#43;--- a/src/import/pkg/kubelet/server/server_test.go
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/server/server_test.go
&#43;@@ -1460,6 &#43;1460,58 @@ func TestCRIHandler(t *testing.T) {
&#43;       assert.Equal(t, query, fw.criHandler.RequestReceived.URL.RawQuery)
&#43; }
&#43;
&#43;&#43;func TestMetricBuckets(t *testing.T) {
&#43;&#43;      tests := map[string]struct {
&#43;&#43;              url    string
&#43;&#43;              bucket string
&#43;&#43;      }{
&#43;&#43;              &quot;healthz endpoint&quot;:                {url: &quot;/healthz&quot;, bucket: &quot;healthz&quot;},
&#43;&#43;              &quot;attach&quot;:                          {url: &quot;/attach/podNamespace/podID/containerName&quot;, bucket: &quot;attach&quot;},
&#43;&#43;              &quot;attach with uid&quot;:                 {url: &quot;/attach/podNamespace/podID/uid/containerName&quot;, bucket: &quot;attach&quot;},
&#43;&#43;              &quot;configz&quot;:                         {url: &quot;/configz&quot;, bucket: &quot;configz&quot;},
&#43;&#43;              &quot;containerLogs&quot;:                   {url: &quot;/containerLogs/podNamespace/podID/containerName&quot;, bucket: &quot;containerLogs&quot;},
&#43;&#43;              &quot;cri&quot;:                             {url: &quot;/cri/&quot;, bucket: &quot;cri&quot;},
&#43;&#43;              &quot;cri with sub&quot;:                    {url: &quot;/cri/foo&quot;, bucket: &quot;cri&quot;},
&#43;&#43;              &quot;debug v flags&quot;:                   {url: &quot;/debug/flags/v&quot;, bucket: &quot;debug&quot;},
&#43;&#43;              &quot;pprof with sub&quot;:                  {url: &quot;/debug/pprof/subpath&quot;, bucket: &quot;debug&quot;},
&#43;&#43;              &quot;exec&quot;:                            {url: &quot;/exec/podNamespace/podID/containerName&quot;, bucket: &quot;exec&quot;},
&#43;&#43;              &quot;exec with uid&quot;:                   {url: &quot;/exec/podNamespace/podID/uid/containerName&quot;, bucket: &quot;exec&quot;},
&#43;&#43;              &quot;healthz&quot;:                         {url: &quot;/healthz/&quot;, bucket: &quot;healthz&quot;},
&#43;&#43;              &quot;healthz log sub&quot;:                 {url: &quot;/healthz/log&quot;, bucket: &quot;healthz&quot;},
&#43;&#43;              &quot;healthz ping&quot;:                    {url: &quot;/healthz/ping&quot;, bucket: &quot;healthz&quot;},
&#43;&#43;              &quot;healthz sync loop&quot;:               {url: &quot;/healthz/syncloop&quot;, bucket: &quot;healthz&quot;},
&#43;&#43;              &quot;logs&quot;:                            {url: &quot;/logs/&quot;, bucket: &quot;logs&quot;},
&#43;&#43;              &quot;logs with path&quot;:                  {url: &quot;/logs/logpath&quot;, bucket: &quot;logs&quot;},
&#43;&#43;              &quot;metrics&quot;:                         {url: &quot;/metrics&quot;, bucket: &quot;metrics&quot;},
&#43;&#43;              &quot;metrics cadvisor sub&quot;:            {url: &quot;/metrics/cadvisor&quot;, bucket: &quot;metrics/cadvisor&quot;},
&#43;&#43;              &quot;metrics probes sub&quot;:              {url: &quot;/metrics/probes&quot;, bucket: &quot;metrics/probes&quot;},
&#43;&#43;              &quot;metrics resource v1alpha1&quot;:       {url: &quot;/metrics/resource/v1alpha1&quot;, bucket: &quot;metrics/resource&quot;},
&#43;&#43;              &quot;metrics resource sub&quot;:            {url: &quot;/metrics/resource&quot;, bucket: &quot;metrics/resource&quot;},
&#43;&#43;              &quot;pods&quot;:                            {url: &quot;/pods/&quot;, bucket: &quot;pods&quot;},
&#43;&#43;              &quot;portForward&quot;:                     {url: &quot;/portForward/podNamespace/podID&quot;, bucket: &quot;portForward&quot;},
&#43;&#43;              &quot;portForward with uid&quot;:            {url: &quot;/portForward/podNamespace/podID/uid&quot;, bucket: &quot;portForward&quot;},
&#43;&#43;              &quot;run&quot;:                             {url: &quot;/run/podNamespace/podID/containerName&quot;, bucket: &quot;run&quot;},
&#43;&#43;              &quot;run with uid&quot;:                    {url: &quot;/run/podNamespace/podID/uid/containerName&quot;, bucket: &quot;run&quot;},
&#43;&#43;              &quot;runningpods&quot;:                     {url: &quot;/runningpods/&quot;, bucket: &quot;runningpods&quot;},
&#43;&#43;              &quot;spec&quot;:                            {url: &quot;/spec/&quot;, bucket: &quot;spec&quot;},
&#43;&#43;              &quot;stats&quot;:                           {url: &quot;/stats/&quot;, bucket: &quot;stats&quot;},
&#43;&#43;              &quot;stats container sub&quot;:             {url: &quot;/stats/container&quot;, bucket: &quot;stats&quot;},
&#43;&#43;              &quot;stats summary sub&quot;:               {url: &quot;/stats/summary&quot;, bucket: &quot;stats&quot;},
&#43;&#43;              &quot;stats containerName with uid&quot;:    {url: &quot;/stats/namespace/podName/uid/containerName&quot;, bucket: &quot;stats&quot;},
&#43;&#43;              &quot;stats containerName&quot;:             {url: &quot;/stats/podName/containerName&quot;, bucket: &quot;stats&quot;},
&#43;&#43;              &quot;invalid path&quot;:                    {url: &quot;/junk&quot;, bucket: &quot;Invalid path&quot;},
&#43;&#43;              &quot;invalid path starting with good&quot;: {url: &quot;/healthzjunk&quot;, bucket: &quot;Invalid path&quot;},
&#43;&#43;      }
&#43;&#43;      fw := newServerTest()
&#43;&#43;      defer fw.testHTTPServer.Close()
&#43;&#43;
&#43;&#43;      for _, test := range tests {
&#43;&#43;              path := test.url
&#43;&#43;              bucket := test.bucket
&#43;&#43;              require.Equal(t, fw.serverUnderTest.getMetricBucket(path), bucket)
&#43;&#43;      }
&#43;&#43;}
&#43;&#43;
&#43; func TestDebuggingDisabledHandlers(t *testing.T) {
&#43;       fw := newServerTestWithDebug(false, false, nil)
&#43;       defer fw.testHTTPServer.Close()
&#43;@@ -1533,6 &#43;1585,6 @@ func TestTrimURLPath(t *testing.T) {
&#43;       }
&#43;
&#43;       for _, test := range tests {
&#43;-              assert.Equal(t, test.expected, trimURLPath(test.path), fmt.Sprintf(&quot;path is: %s&quot;, test.path))
&#43;&#43;              assert.Equal(t, test.expected, getURLRootPath(test.path), fmt.Sprintf(&quot;path is: %s&quot;, test.path))
&#43;       }
&#43; }
&#43;--
&#43;2.17.1
&#43;
diff --git a/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch b/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
new file mode 100644
index 0000000..82e5fc6
--- /dev/null
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes/0001-Add-new-endpoint-for-resource-metrics.patch
@@ -0,0 &#43;1,440 @@
&#43;From 0db7074e1ad237af1a513bdf51160bf4b4cdc9f1 Mon Sep 17 00:00:00 2001
&#43;From: RainbowMango <a class="moz-txt-link-rfc2396E" href="mailto:renhongcai@huawei.com">&lt;renhongcai@huawei.com&gt;</a>
&#43;Date: Sun, 15 Dec 2019 17:06:13 &#43;0800
&#43;Subject: [PATCH] Add new endpoint for resource metrics.
&#43;
&#43;This commit is required for context to fix CVE-2020-8551.
&#43;
&#43;Upstream Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/kubernetes/kubernetes/pull/86282/commits/0db7074e1ad237af1a513bdf51160bf4b4cdc9f1">https://github.com/kubernetes/kubernetes/pull/86282/commits/0db7074e1ad237af1a513bdf51160bf4b4cdc9f1</a>]
&#43;CVE: CVE-2020-8551
&#43;
&#43;Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
&#43;---
&#43; .../metrics/collectors/resource_metrics.go    | 153 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
&#43; .../collectors/resource_metrics_test.go       | 189 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
&#43; pkg/kubelet/server/auth_test.go               |   1 &#43;
&#43; pkg/kubelet/server/server.go                  |  23 &#43;&#43;-
&#43; 4 files changed, 358 insertions(&#43;), 8 deletions(-)
&#43; create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics.go
&#43; create mode 100644 pkg/kubelet/metrics/collectors/resource_metrics_test.go
&#43;
&#43;diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
&#43;new file mode 100644
&#43;index 00000000000..a3667127903
&#43;--- /dev/null
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/metrics/collectors/resource_metrics.go
&#43;@@ -0,0 &#43;1,153 @@
&#43;&#43;/*
&#43;&#43;Copyright 2019 The Kubernetes Authors.
&#43;&#43;
&#43;&#43;Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
&#43;&#43;you may not use this file except in compliance with the License.
&#43;&#43;You may obtain a copy of the License at
&#43;&#43;
&#43;&#43;    <a class="moz-txt-link-freetext" href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a>
&#43;&#43;
&#43;&#43;Unless required by applicable law or agreed to in writing, software
&#43;&#43;distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
&#43;&#43;WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
&#43;&#43;See the License for the specific language governing permissions and
&#43;&#43;limitations under the License.
&#43;&#43;*/
&#43;&#43;
&#43;&#43;package collectors
&#43;&#43;
&#43;&#43;import (
&#43;&#43;      &quot;time&quot;
&#43;&#43;
&#43;&#43;      &quot;k8s.io/component-base/metrics&quot;
&#43;&#43;      &quot;k8s.io/klog&quot;
&#43;&#43;      summary &quot;k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1&quot;
&#43;&#43;      &quot;k8s.io/kubernetes/pkg/kubelet/server/stats&quot;
&#43;&#43;)
&#43;&#43;
&#43;&#43;var (
&#43;&#43;      nodeCPUUsageDesc = metrics.NewDesc(&quot;node_cpu_usage_seconds&quot;,
&#43;&#43;              &quot;Cumulative cpu time consumed by the node in core-seconds&quot;,
&#43;&#43;              nil,
&#43;&#43;              nil,
&#43;&#43;              metrics.ALPHA,
&#43;&#43;              &quot;&quot;)
&#43;&#43;
&#43;&#43;      nodeMemoryUsageDesc = metrics.NewDesc(&quot;node_memory_working_set_bytes&quot;,
&#43;&#43;              &quot;Current working set of the node in bytes&quot;,
&#43;&#43;              nil,
&#43;&#43;              nil,
&#43;&#43;              metrics.ALPHA,
&#43;&#43;              &quot;&quot;)
&#43;&#43;
&#43;&#43;      containerCPUUsageDesc = metrics.NewDesc(&quot;container_cpu_usage_seconds&quot;,
&#43;&#43;              &quot;Cumulative cpu time consumed by the container in core-seconds&quot;,
&#43;&#43;              []string{&quot;container&quot;, &quot;pod&quot;, &quot;namespace&quot;},
&#43;&#43;              nil,
&#43;&#43;              metrics.ALPHA,
&#43;&#43;              &quot;&quot;)
&#43;&#43;
&#43;&#43;      containerMemoryUsageDesc = metrics.NewDesc(&quot;container_memory_working_set_bytes&quot;,
&#43;&#43;              &quot;Current working set of the container in bytes&quot;,
&#43;&#43;              []string{&quot;container&quot;, &quot;pod&quot;, &quot;namespace&quot;},
&#43;&#43;              nil,
&#43;&#43;              metrics.ALPHA,
&#43;&#43;              &quot;&quot;)
&#43;&#43;
&#43;&#43;      resouceScrapeResultDesc = metrics.NewDesc(&quot;scrape_error&quot;,
&#43;&#43;              &quot;1 if there was an error while getting container metrics, 0 otherwise&quot;,
&#43;&#43;              nil,
&#43;&#43;              nil,
&#43;&#43;              metrics.ALPHA,
&#43;&#43;              &quot;&quot;)
&#43;&#43;)
&#43;&#43;
&#43;&#43;// NewResourceMetricsCollector returns a metrics.StableCollector which exports resource metrics
&#43;&#43;func NewResourceMetricsCollector(provider stats.SummaryProvider) metrics.StableCollector {
&#43;&#43;      return &amp;resourceMetricsCollector{
&#43;&#43;              provider: provider,
&#43;&#43;      }
&#43;&#43;}
&#43;&#43;
&#43;&#43;type resourceMetricsCollector struct {
&#43;&#43;      metrics.BaseStableCollector
&#43;&#43;
&#43;&#43;      provider stats.SummaryProvider
&#43;&#43;}
&#43;&#43;
&#43;&#43;// Check if resourceMetricsCollector implements necessary interface
&#43;&#43;var _ metrics.StableCollector = &amp;resourceMetricsCollector{}
&#43;&#43;
&#43;&#43;// DescribeWithStability implements metrics.StableCollector
&#43;&#43;func (rc *resourceMetricsCollector) DescribeWithStability(ch chan&lt;- *metrics.Desc) {
&#43;&#43;      ch &lt;- nodeCPUUsageDesc
&#43;&#43;      ch &lt;- nodeMemoryUsageDesc
&#43;&#43;      ch &lt;- containerCPUUsageDesc
&#43;&#43;      ch &lt;- containerMemoryUsageDesc
&#43;&#43;      ch &lt;- resouceScrapeResultDesc
&#43;&#43;}
&#43;&#43;
&#43;&#43;// CollectWithStability implements metrics.StableCollector
&#43;&#43;// Since new containers are frequently created and removed, using the Gauge would
&#43;&#43;// leak metric collectors for containers or pods that no longer exist.  Instead, implement
&#43;&#43;// custom collector in a way that only collects metrics for active containers.
&#43;&#43;func (rc *resourceMetricsCollector) CollectWithStability(ch chan&lt;- metrics.Metric) {
&#43;&#43;      var errorCount float64
&#43;&#43;      defer func() {
&#43;&#43;              ch &lt;- metrics.NewLazyConstMetric(resouceScrapeResultDesc, metrics.GaugeValue, errorCount)
&#43;&#43;      }()
&#43;&#43;      statsSummary, err := rc.provider.GetCPUAndMemoryStats()
&#43;&#43;      if err != nil {
&#43;&#43;              errorCount = 1
&#43;&#43;              klog.Warningf(&quot;Error getting summary for resourceMetric prometheus endpoint: %v&quot;, err)
&#43;&#43;              return
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      rc.collectNodeCPUMetrics(ch, statsSummary.Node)
&#43;&#43;      rc.collectNodeMemoryMetrics(ch, statsSummary.Node)
&#43;&#43;
&#43;&#43;      for _, pod := range statsSummary.Pods {
&#43;&#43;              for _, container := range pod.Containers {
&#43;&#43;                      rc.collectContainerCPUMetrics(ch, pod, container)
&#43;&#43;                      rc.collectContainerMemoryMetrics(ch, pod, container)
&#43;&#43;              }
&#43;&#43;      }
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (rc *resourceMetricsCollector) collectNodeCPUMetrics(ch chan&lt;- metrics.Metric, s summary.NodeStats) {
&#43;&#43;      if s.CPU == nil {
&#43;&#43;              return
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      ch &lt;- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
&#43;&#43;              metrics.NewLazyConstMetric(nodeCPUUsageDesc, metrics.GaugeValue, float64(*s.CPU.UsageCoreNanoSeconds)/float64(time.Second)))
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (rc *resourceMetricsCollector) collectNodeMemoryMetrics(ch chan&lt;- metrics.Metric, s summary.NodeStats) {
&#43;&#43;      if s.Memory == nil {
&#43;&#43;              return
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      ch &lt;- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
&#43;&#43;              metrics.NewLazyConstMetric(nodeMemoryUsageDesc, metrics.GaugeValue, float64(*s.Memory.WorkingSetBytes)))
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (rc *resourceMetricsCollector) collectContainerCPUMetrics(ch chan&lt;- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
&#43;&#43;      if s.CPU == nil {
&#43;&#43;              return
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      ch &lt;- metrics.NewLazyMetricWithTimestamp(s.CPU.Time.Time,
&#43;&#43;              metrics.NewLazyConstMetric(containerCPUUsageDesc, metrics.GaugeValue,
&#43;&#43;                      float64(*s.CPU.UsageCoreNanoSeconds)/float64(time.Second), s.Name, pod.PodRef.Name, pod.PodRef.Namespace))
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (rc *resourceMetricsCollector) collectContainerMemoryMetrics(ch chan&lt;- metrics.Metric, pod summary.PodStats, s summary.ContainerStats) {
&#43;&#43;      if s.Memory == nil {
&#43;&#43;              return
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      ch &lt;- metrics.NewLazyMetricWithTimestamp(s.Memory.Time.Time,
&#43;&#43;              metrics.NewLazyConstMetric(containerMemoryUsageDesc, metrics.GaugeValue,
&#43;&#43;                      float64(*s.Memory.WorkingSetBytes), s.Name, pod.PodRef.Name, pod.PodRef.Namespace))
&#43;&#43;}
&#43;diff --git a/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go
&#43;new file mode 100644
&#43;index 00000000000..b92aabbd675
&#43;--- /dev/null
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/metrics/collectors/resource_metrics_test.go
&#43;@@ -0,0 &#43;1,189 @@
&#43;&#43;/*
&#43;&#43;Copyright 2019 The Kubernetes Authors.
&#43;&#43;
&#43;&#43;Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
&#43;&#43;you may not use this file except in compliance with the License.
&#43;&#43;You may obtain a copy of the License at
&#43;&#43;
&#43;&#43;    <a class="moz-txt-link-freetext" href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a>
&#43;&#43;
&#43;&#43;Unless required by applicable law or agreed to in writing, software
&#43;&#43;distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
&#43;&#43;WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
&#43;&#43;See the License for the specific language governing permissions and
&#43;&#43;limitations under the License.
&#43;&#43;*/
&#43;&#43;
&#43;&#43;package collectors
&#43;&#43;
&#43;&#43;import (
&#43;&#43;      &quot;fmt&quot;
&#43;&#43;      &quot;strings&quot;
&#43;&#43;      &quot;testing&quot;
&#43;&#43;      &quot;time&quot;
&#43;&#43;
&#43;&#43;      &quot;github.com/stretchr/testify/mock&quot;
&#43;&#43;
&#43;&#43;      metav1 &quot;k8s.io/apimachinery/pkg/apis/meta/v1&quot;
&#43;&#43;      &quot;k8s.io/component-base/metrics/testutil&quot;
&#43;&#43;      statsapi &quot;k8s.io/kubernetes/pkg/kubelet/apis/stats/v1alpha1&quot;
&#43;&#43;)
&#43;&#43;
&#43;&#43;type mockSummaryProvider struct {
&#43;&#43;      mock.Mock
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (m *mockSummaryProvider) Get(updateStats bool) (*statsapi.Summary, error) {
&#43;&#43;      args := m.Called(updateStats)
&#43;&#43;      return args.Get(0).(*statsapi.Summary), args.Error(1)
&#43;&#43;}
&#43;&#43;
&#43;&#43;func (m *mockSummaryProvider) GetCPUAndMemoryStats() (*statsapi.Summary, error) {
&#43;&#43;      args := m.Called()
&#43;&#43;      return args.Get(0).(*statsapi.Summary), args.Error(1)
&#43;&#43;}
&#43;&#43;
&#43;&#43;func TestCollectResourceMetrics(t *testing.T) {
&#43;&#43;      testTime := metav1.NewTime(time.Unix(2, 0)) // a static timestamp: 2000
&#43;&#43;      interestedMetrics := []string{
&#43;&#43;              &quot;scrape_error&quot;,
&#43;&#43;              &quot;node_cpu_usage_seconds&quot;,
&#43;&#43;              &quot;node_memory_working_set_bytes&quot;,
&#43;&#43;              &quot;container_cpu_usage_seconds&quot;,
&#43;&#43;              &quot;container_memory_working_set_bytes&quot;,
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      tests := []struct {
&#43;&#43;              name            string
&#43;&#43;              summary         *statsapi.Summary
&#43;&#43;              summaryErr      error
&#43;&#43;              expectedMetrics string
&#43;&#43;      }{
&#43;&#43;              {
&#43;&#43;                      name:       &quot;error getting summary&quot;,
&#43;&#43;                      summary:    nil,
&#43;&#43;                      summaryErr: fmt.Errorf(&quot;failed to get summary&quot;),
&#43;&#43;                      expectedMetrics: `
&#43;&#43;                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
&#43;&#43;                              # TYPE scrape_error gauge
&#43;&#43;                              scrape_error 1
&#43;&#43;                      `,
&#43;&#43;              },
&#43;&#43;              {
&#43;&#43;                      name: &quot;arbitrary node metrics&quot;,
&#43;&#43;                      summary: &amp;statsapi.Summary{
&#43;&#43;                              Node: statsapi.NodeStats{
&#43;&#43;                                      CPU: &amp;statsapi.CPUStats{
&#43;&#43;                                              Time:                 testTime,
&#43;&#43;                                              UsageCoreNanoSeconds: uint64Ptr(10000000000),
&#43;&#43;                                      },
&#43;&#43;                                      Memory: &amp;statsapi.MemoryStats{
&#43;&#43;                                              Time:            testTime,
&#43;&#43;                                              WorkingSetBytes: uint64Ptr(1000),
&#43;&#43;                                      },
&#43;&#43;                              },
&#43;&#43;                      },
&#43;&#43;                      summaryErr: nil,
&#43;&#43;                      expectedMetrics: `
&#43;&#43;                              # HELP node_cpu_usage_seconds [ALPHA] Cumulative cpu time consumed by the node in core-seconds
&#43;&#43;                              # TYPE node_cpu_usage_seconds gauge
&#43;&#43;                              node_cpu_usage_seconds 10 2000
&#43;&#43;                              # HELP node_memory_working_set_bytes [ALPHA] Current working set of the node in bytes
&#43;&#43;                              # TYPE node_memory_working_set_bytes gauge
&#43;&#43;                              node_memory_working_set_bytes 1000 2000
&#43;&#43;                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
&#43;&#43;                              # TYPE scrape_error gauge
&#43;&#43;                              scrape_error 0
&#43;&#43;                      `,
&#43;&#43;              },
&#43;&#43;              {
&#43;&#43;                      name: &quot;arbitrary container metrics for different container, pods and namespaces&quot;,
&#43;&#43;                      summary: &amp;statsapi.Summary{
&#43;&#43;                              Pods: []statsapi.PodStats{
&#43;&#43;                                      {
&#43;&#43;                                              PodRef: statsapi.PodReference{
&#43;&#43;                                                      Name:      &quot;pod_a&quot;,
&#43;&#43;                                                      Namespace: &quot;namespace_a&quot;,
&#43;&#43;                                              },
&#43;&#43;                                              Containers: []statsapi.ContainerStats{
&#43;&#43;                                                      {
&#43;&#43;                                                              Name: &quot;container_a&quot;,
&#43;&#43;                                                              CPU: &amp;statsapi.CPUStats{
&#43;&#43;                                                                      Time:                 testTime,
&#43;&#43;                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
&#43;&#43;                                                              },
&#43;&#43;                                                              Memory: &amp;statsapi.MemoryStats{
&#43;&#43;                                                                      Time:            testTime,
&#43;&#43;                                                                      WorkingSetBytes: uint64Ptr(1000),
&#43;&#43;                                                              },
&#43;&#43;                                                      },
&#43;&#43;                                                      {
&#43;&#43;                                                              Name: &quot;container_b&quot;,
&#43;&#43;                                                              CPU: &amp;statsapi.CPUStats{
&#43;&#43;                                                                      Time:                 testTime,
&#43;&#43;                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
&#43;&#43;                                                              },
&#43;&#43;                                                              Memory: &amp;statsapi.MemoryStats{
&#43;&#43;                                                                      Time:            testTime,
&#43;&#43;                                                                      WorkingSetBytes: uint64Ptr(1000),
&#43;&#43;                                                              },
&#43;&#43;                                                      },
&#43;&#43;                                              },
&#43;&#43;                                      },
&#43;&#43;                                      {
&#43;&#43;                                              PodRef: statsapi.PodReference{
&#43;&#43;                                                      Name:      &quot;pod_b&quot;,
&#43;&#43;                                                      Namespace: &quot;namespace_b&quot;,
&#43;&#43;                                              },
&#43;&#43;                                              Containers: []statsapi.ContainerStats{
&#43;&#43;                                                      {
&#43;&#43;                                                              Name: &quot;container_a&quot;,
&#43;&#43;                                                              CPU: &amp;statsapi.CPUStats{
&#43;&#43;                                                                      Time:                 testTime,
&#43;&#43;                                                                      UsageCoreNanoSeconds: uint64Ptr(10000000000),
&#43;&#43;                                                              },
&#43;&#43;                                                              Memory: &amp;statsapi.MemoryStats{
&#43;&#43;                                                                      Time:            testTime,
&#43;&#43;                                                                      WorkingSetBytes: uint64Ptr(1000),
&#43;&#43;                                                              },
&#43;&#43;                                                      },
&#43;&#43;                                              },
&#43;&#43;                                      },
&#43;&#43;                              },
&#43;&#43;                      },
&#43;&#43;                      summaryErr: nil,
&#43;&#43;                      expectedMetrics: `
&#43;&#43;                              # HELP scrape_error [ALPHA] 1 if there was an error while getting container metrics, 0 otherwise
&#43;&#43;                              # TYPE scrape_error gauge
&#43;&#43;                              scrape_error 0
&#43;&#43;                              # HELP container_cpu_usage_seconds [ALPHA] Cumulative cpu time consumed by the container in core-seconds
&#43;&#43;                              # TYPE container_cpu_usage_seconds gauge
&#43;&#43;                              container_cpu_usage_seconds{container=&quot;container_a&quot;,namespace=&quot;namespace_a&quot;,pod=&quot;pod_a&quot;} 10 2000
&#43;&#43;                              container_cpu_usage_seconds{container=&quot;container_a&quot;,namespace=&quot;namespace_b&quot;,pod=&quot;pod_b&quot;} 10 2000
&#43;&#43;                              container_cpu_usage_seconds{container=&quot;container_b&quot;,namespace=&quot;namespace_a&quot;,pod=&quot;pod_a&quot;} 10 2000
&#43;&#43;                              # HELP container_memory_working_set_bytes [ALPHA] Current working set of the container in bytes
&#43;&#43;                              # TYPE container_memory_working_set_bytes gauge
&#43;&#43;                              container_memory_working_set_bytes{container=&quot;container_a&quot;,namespace=&quot;namespace_a&quot;,pod=&quot;pod_a&quot;} 1000 2000
&#43;&#43;                              container_memory_working_set_bytes{container=&quot;container_a&quot;,namespace=&quot;namespace_b&quot;,pod=&quot;pod_b&quot;} 1000 2000
&#43;&#43;                              container_memory_working_set_bytes{container=&quot;container_b&quot;,namespace=&quot;namespace_a&quot;,pod=&quot;pod_a&quot;} 1000 2000
&#43;&#43;                      `,
&#43;&#43;              },
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      for _, test := range tests {
&#43;&#43;              tc := test
&#43;&#43;              t.Run(tc.name, func(t *testing.T) {
&#43;&#43;                      provider := &amp;mockSummaryProvider{}
&#43;&#43;                      provider.On(&quot;GetCPUAndMemoryStats&quot;).Return(tc.summary, tc.summaryErr)
&#43;&#43;                      collector := NewResourceMetricsCollector(provider)
&#43;&#43;
&#43;&#43;                      if err := testutil.CustomCollectAndCompare(collector, strings.NewReader(tc.expectedMetrics), interestedMetrics...); err != nil {
&#43;&#43;                              t.Fatal(err)
&#43;&#43;                      }
&#43;&#43;              })
&#43;&#43;      }
&#43;&#43;}
&#43;&#43;
&#43;&#43;func uint64Ptr(u uint64) *uint64 {
&#43;&#43;      return &amp;u
&#43;&#43;}
&#43;diff --git a/src/import/pkg/kubelet/server/auth_test.go b/src/import/pkg/kubelet/server/auth_test.go
&#43;index d598bc3892b..638f3ba2bf0 100644
&#43;--- a/src/import/pkg/kubelet/server/auth_test.go
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/server/auth_test.go
&#43;@@ -128,6 &#43;128,7 @@ func AuthzTestCases() []AuthzTestCase {
&#43;               &quot;/metrics/cadvisor&quot;:                   &quot;metrics&quot;,
&#43;               &quot;/metrics/probes&quot;:                     &quot;metrics&quot;,
&#43;               &quot;/metrics/resource/v1alpha1&quot;:          &quot;metrics&quot;,
&#43;&#43;              &quot;/metrics/resource&quot;:                   &quot;metrics&quot;,
&#43;               &quot;/pods/&quot;:                              &quot;proxy&quot;,
&#43;               &quot;/portForward/{podNamespace}/{podID}&quot;: &quot;proxy&quot;,
&#43;               &quot;/portForward/{podNamespace}/{podID}/{uid}&quot;:         &quot;proxy&quot;,
&#43;diff --git a/src/import/pkg/kubelet/server/server.go b/src/import/pkg/kubelet/server/server.go
&#43;index 87f3bd28a25..74eeaf10171 100644
&#43;--- a/src/import/pkg/kubelet/server/server.go
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/server/server.go
&#43;@@ -38,6 &#43;38,7 @@ import (
&#43;       &quot;github.com/google/cadvisor/metrics&quot;
&#43;       &quot;google.golang.org/grpc&quot;
&#43;       &quot;k8s.io/klog&quot;
&#43;&#43;      &quot;k8s.io/kubernetes/pkg/kubelet/metrics/collectors&quot;
&#43;
&#43;       &quot;k8s.io/api/core/v1&quot;
&#43;       metav1 &quot;k8s.io/apimachinery/pkg/apis/meta/v1&quot;
&#43;@@ -74,13 &#43;75,13 @@ import (
&#43; )
&#43;
&#43; const (
&#43;-      metricsPath               = &quot;/metrics&quot;
&#43;-      cadvisorMetricsPath       = &quot;/metrics/cadvisor&quot;
&#43;-      resourceMetricsPathPrefix = &quot;/metrics/resource&quot;
&#43;-      proberMetricsPath         = &quot;/metrics/probes&quot;
&#43;-      specPath                  = &quot;/spec/&quot;
&#43;-      statsPath                 = &quot;/stats/&quot;
&#43;-      logsPath                  = &quot;/logs/&quot;
&#43;&#43;      metricsPath         = &quot;/metrics&quot;
&#43;&#43;      cadvisorMetricsPath = &quot;/metrics/cadvisor&quot;
&#43;&#43;      resourceMetricsPath = &quot;/metrics/resource&quot;
&#43;&#43;      proberMetricsPath   = &quot;/metrics/probes&quot;
&#43;&#43;      specPath            = &quot;/spec/&quot;
&#43;&#43;      statsPath           = &quot;/stats/&quot;
&#43;&#43;      logsPath            = &quot;/logs/&quot;
&#43; )
&#43;
&#43; // Server is a http.Handler which exposes kubelet functionality over HTTP.
&#43;@@ -321,10 &#43;322,16 @@ func (s *Server) InstallDefaultHandlers(enableCAdvisorJSONEndpoints bool) {
&#43;
&#43;       v1alpha1ResourceRegistry := compbasemetrics.NewKubeRegistry()
&#43;       v1alpha1ResourceRegistry.CustomMustRegister(stats.NewPrometheusResourceMetricCollector(s.resourceAnalyzer, v1alpha1.Config()))
&#43;-      s.restfulCont.Handle(path.Join(resourceMetricsPathPrefix, v1alpha1.Version),
&#43;&#43;      s.restfulCont.Handle(path.Join(resourceMetricsPath, v1alpha1.Version),
&#43;               compbasemetrics.HandlerFor(v1alpha1ResourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
&#43;       )
&#43;
&#43;&#43;      resourceRegistry := compbasemetrics.NewKubeRegistry()
&#43;&#43;      resourceRegistry.CustomMustRegister(collectors.NewResourceMetricsCollector(s.resourceAnalyzer))
&#43;&#43;      s.restfulCont.Handle(resourceMetricsPath,
&#43;&#43;              compbasemetrics.HandlerFor(resourceRegistry, compbasemetrics.HandlerOpts{ErrorHandling: compbasemetrics.ContinueOnError}),
&#43;&#43;      )
&#43;&#43;
&#43;       // prober metrics are exposed under a different endpoint
&#43;
&#43;       p := compbasemetrics.NewKubeRegistry()
&#43;--
&#43;2.20.1
&#43;
diff --git a/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch b/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
new file mode 100644
index 0000000..f7a5c7c
--- /dev/null
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes/0001-Deal-with-auto-generated-files.patch
@@ -0,0 &#43;1,60 @@
&#43;From c394d821fdafd719619eb63fcd1065a95ec02ef9 Mon Sep 17 00:00:00 2001
&#43;From: RainbowMango <a class="moz-txt-link-rfc2396E" href="mailto:renhongcai@huawei.com">&lt;renhongcai@huawei.com&gt;</a>
&#43;Date: Sun, 15 Dec 2019 18:37:38 &#43;0800
&#43;Subject: [PATCH] Deal with auto-generated files: - Update bazel by
&#43; hack/update-bazel.sh
&#43;
&#43;This commit is needed for context to fix CVE-2020-8551
&#43;
&#43;Upstream Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/kubernetes/kubernetes/pull/86282/commits/c394d821fdafd719619eb63fcd1065a95ec02ef9">https://github.com/kubernetes/kubernetes/pull/86282/commits/c394d821fdafd719619eb63fcd1065a95ec02ef9</a>]
&#43;CVE: CVE-2020-8551
&#43;
&#43;Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
&#43;---
&#43; pkg/kubelet/metrics/collectors/BUILD | 3 &#43;&#43;&#43;
&#43; pkg/kubelet/server/BUILD             | 1 &#43;
&#43; 2 files changed, 4 insertions(&#43;)
&#43;
&#43;diff --git a/src/import/pkg/kubelet/metrics/collectors/BUILD b/src/import/pkg/kubelet/metrics/collectors/BUILD
&#43;index 00bc335320f..25398793eab 100644
&#43;--- a/src/import/pkg/kubelet/metrics/collectors/BUILD
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/metrics/collectors/BUILD
&#43;@@ -4,6 &#43;4,7 @@ go_library(
&#43;     name = &quot;go_default_library&quot;,
&#43;     srcs = [
&#43;         &quot;log_metrics.go&quot;,
&#43;&#43;        &quot;resource_metrics.go&quot;,
&#43;         &quot;volume_stats.go&quot;,
&#43;     ],
&#43;     importpath = &quot;k8s.io/kubernetes/pkg/kubelet/metrics/collectors&quot;,
&#43;@@ -22,6 &#43;23,7 @@ go_test(
&#43;     name = &quot;go_default_test&quot;,
&#43;     srcs = [
&#43;         &quot;log_metrics_test.go&quot;,
&#43;&#43;        &quot;resource_metrics_test.go&quot;,
&#43;         &quot;volume_stats_test.go&quot;,
&#43;     ],
&#43;     embed = [&quot;:go_default_library&quot;],
&#43;@@ -30,6 &#43;32,7 @@ go_test(
&#43;         &quot;//pkg/kubelet/server/stats/testing:go_default_library&quot;,
&#43;         &quot;//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1:go_default_library&quot;,
&#43;         &quot;//staging/src/k8s.io/component-base/metrics/testutil:go_default_library&quot;,
&#43;&#43;        &quot;//vendor/github.com/stretchr/testify/mock:go_default_library&quot;,
&#43;     ],
&#43; )
&#43;
&#43;diff --git a/src/import/pkg/kubelet/server/BUILD b/src/import/pkg/kubelet/server/BUILD
&#43;index d83619fcbe5..a18f1b5e83b 100644
&#43;--- a/src/import/pkg/kubelet/server/BUILD
&#43;&#43;&#43;&#43; b/src/import/pkg/kubelet/server/BUILD
&#43;@@ -22,6 &#43;22,7 @@ go_library(
&#43;         &quot;//pkg/kubelet/apis/podresources/v1alpha1:go_default_library&quot;,
&#43;         &quot;//pkg/kubelet/apis/resourcemetrics/v1alpha1:go_default_library&quot;,
&#43;         &quot;//pkg/kubelet/container:go_default_library&quot;,
&#43;&#43;        &quot;//pkg/kubelet/metrics/collectors:go_default_library&quot;,
&#43;         &quot;//pkg/kubelet/prober:go_default_library&quot;,
&#43;         &quot;//pkg/kubelet/server/metrics:go_default_library&quot;,
&#43;         &quot;//pkg/kubelet/server/portforward:go_default_library&quot;,
&#43;--
&#43;2.20.1
&#43;
diff --git a/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch b/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
new file mode 100644
index 0000000..d4bf783
--- /dev/null
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes/0001-remove-client-label-from-apiserver-request-count-met.patch
@@ -0,0 &#43;1,171 @@
&#43;From a657089732c0bd5d4515fb9208182c31c6c05790 Mon Sep 17 00:00:00 2001
&#43;From: Han Kang <a class="moz-txt-link-rfc2396E" href="mailto:hankang@google.com">&lt;hankang@google.com&gt;</a>
&#43;Date: Wed, 29 Jan 2020 12:25:55 -0800
&#43;Subject: [PATCH] remove client label from apiserver request count metric since
&#43; it is unbounded
&#43;
&#43;Change-Id: I3a9eacebc9d9dc9ed6347260d9378cdcb5743431
&#43;
&#43;Upstream Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/kubernetes/kubernetes/pull/87669/commits/cc3190968b1f14ddf4067abef849fc41bd6068dc">https://github.com/kubernetes/kubernetes/pull/87669/commits/cc3190968b1f14ddf4067abef849fc41bd6068dc</a>]
&#43;CVE: CVE-2020-8552
&#43;
&#43;Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
&#43;---
&#43; .../apiserver/pkg/endpoints/metrics/BUILD     |  8 ---
&#43; .../pkg/endpoints/metrics/metrics.go          | 23 &#43;&#43;------
&#43; .../pkg/endpoints/metrics/metrics_test.go     | 54 -------------------
&#43; 3 files changed, 4 insertions(&#43;), 81 deletions(-)
&#43; delete mode 100644 staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
&#43;
&#43;diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
&#43;index 8d13a34eadc..8abb3d1a611 100644
&#43;--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/BUILD
&#43;@@ -3,13 &#43;3,6 @@ package(default_visibility = [&quot;//visibility:public&quot;])
&#43; load(
&#43;     &quot;@io_bazel_rules_go//go:def.bzl&quot;,
&#43;     &quot;go_library&quot;,
&#43;-    &quot;go_test&quot;,
&#43;-)
&#43;-
&#43;-go_test(
&#43;-    name = &quot;go_default_test&quot;,
&#43;-    srcs = [&quot;metrics_test.go&quot;],
&#43;-    embed = [&quot;:go_default_library&quot;],
&#43; )
&#43;
&#43; go_library(
&#43;@@ -20,7 &#43;13,6 @@ go_library(
&#43;     deps = [
&#43;         &quot;//staging/src/k8s.io/apimachinery/pkg/apis/meta/v1/validation:go_default_library&quot;,
&#43;         &quot;//staging/src/k8s.io/apimachinery/pkg/types:go_default_library&quot;,
&#43;-        &quot;//staging/src/k8s.io/apimachinery/pkg/util/<a class="moz-txt-link-freetext" href="net:go_default_library">net:go_default_library</a>&quot;,
&#43;         &quot;//staging/src/k8s.io/apimachinery/pkg/util/sets:go_default_library&quot;,
&#43;         &quot;//staging/src/k8s.io/apiserver/pkg/endpoints/request:go_default_library&quot;,
&#43;         &quot;//staging/src/k8s.io/apiserver/pkg/features:go_default_library&quot;,
&#43;diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
&#43;index 36ff861da7a..81a9a2c5e6f 100644
&#43;--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics.go
&#43;@@ -31,7 &#43;31,6 @@ import (
&#43;
&#43;       &quot;k8s.io/apimachinery/pkg/apis/meta/v1/validation&quot;
&#43;       &quot;k8s.io/apimachinery/pkg/types&quot;
&#43;-      utilnet &quot;k8s.io/apimachinery/pkg/util/net&quot;
&#43;       utilsets &quot;k8s.io/apimachinery/pkg/util/sets&quot;
&#43;       &quot;k8s.io/apiserver/pkg/endpoints/request&quot;
&#43;       &quot;k8s.io/apiserver/pkg/features<a class="moz-txt-link-rfc2396E" href="mailto:&#43;@@-65,14&#43;64,14@@var(&#43;requestCounter=compbasemetrics.NewCounterVec(&#43;&amp;compbasemetrics.CounterOpts{&#43;Name:">&quot;
&#43;@@ -65,14 &#43;64,14 @@ var (
&#43;       requestCounter = compbasemetrics.NewCounterVec(
&#43;               &amp;compbasemetrics.CounterOpts{
&#43;                       Name:           &quot;</a>apiserver_request_total&quot;,
&#43;-                      Help:           &quot;Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, client, and HTTP response contentType and code.&quot;,
&#43;&#43;                      Help:           &quot;Counter of apiserver requests broken out for each verb, dry run value, group, version, resource, scope, component, and HTTP response contentType and code.&quot;,
&#43;                       StabilityLevel: compbasemetrics.ALPHA,
&#43;               },
&#43;               // The label_name contentType doesn't follow the label_name convention defined here:
&#43;               // <a class="moz-txt-link-freetext" href="https://github.com/kubernetes/community/blob/master/contributors/devel/sig-instrumentation/instrumentation.md">https://github.com/kubernetes/community/blob/master/contributors/devel/sig-instrumentation/instrumentation.md</a>
&#43;               // But changing it would break backwards compatibility. Future label_names
&#43;               // should be all lowercase and separated by underscores.
&#43;-              []string{&quot;verb&quot;, &quot;dry_run&quot;, &quot;group&quot;, &quot;version&quot;, &quot;resource&quot;, &quot;subresource&quot;, &quot;scope&quot;, &quot;component&quot;, &quot;client&quot;, &quot;contentType&quot;, &quot;code&quot;},
&#43;&#43;              []string{&quot;verb&quot;, &quot;dry_run&quot;, &quot;group&quot;, &quot;version&quot;, &quot;resource&quot;, &quot;subresource&quot;, &quot;scope&quot;, &quot;component&quot;, &quot;contentType&quot;, &quot;code&quot;},
&#43;       )
&#43;       deprecatedRequestCounter = compbasemetrics.NewCounterVec(
&#43;               &amp;compbasemetrics.CounterOpts{
&#43;@@ -301,11 &#43;300,10 @@ func RecordLongRunning(req *http.Request, requestInfo *request.RequestInfo, comp
&#43; func MonitorRequest(req *http.Request, verb, group, version, resource, subresource, scope, component, contentType string, httpCode, respSize int, elapsed time.Duration) {
&#43;       reportedVerb := cleanVerb(verb, req)
&#43;       dryRun := cleanDryRun(req.URL)
&#43;-      client := cleanUserAgent(utilnet.GetHTTPClient(req))
&#43;       elapsedMicroseconds := float64(elapsed / time.Microsecond)
&#43;       elapsedSeconds := elapsed.Seconds()
&#43;-      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
&#43;-      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, client, contentType, codeToString(httpCode)).Inc()
&#43;&#43;      requestCounter.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
&#43;&#43;      deprecatedRequestCounter.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component, contentType, codeToString(httpCode)).Inc()
&#43;       requestLatencies.WithLabelValues(reportedVerb, dryRun, group, version, resource, subresource, scope, component).Observe(elapsedSeconds)
&#43;       deprecatedRequestLatencies.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
&#43;       deprecatedRequestLatenciesSummary.WithLabelValues(reportedVerb, group, version, resource, subresource, scope, component).Observe(elapsedMicroseconds)
&#43;@@ -425,19 &#43;423,6 @@ func cleanDryRun(u *url.URL) string {
&#43;       return strings.Join(utilsets.NewString(dryRun...).List(), &quot;,&quot;)
&#43; }
&#43;
&#43;-func cleanUserAgent(ua string) string {
&#43;-      // We collapse all &quot;web browser&quot;-type user agents into one &quot;browser&quot; to reduce metric cardinality.
&#43;-      if strings.HasPrefix(ua, &quot;Mozilla/&quot;) {
&#43;-              return &quot;Browser&quot;
&#43;-      }
&#43;-      // If an old &quot;kubectl.exe&quot; has passed us its full path, we discard the path portion.
&#43;-      if kubectlExeRegexp.MatchString(ua) {
&#43;-              // avoid an allocation
&#43;-              ua = kubectlExeRegexp.ReplaceAllString(ua, &quot;$1&quot;)
&#43;-      }
&#43;-      return ua
&#43;-}
&#43;-
&#43; // ResponseWriterDelegator interface wraps http.ResponseWriter to additionally record content-length, status-code, etc.
&#43; type ResponseWriterDelegator struct {
&#43;       http.ResponseWriter
&#43;diff --git a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go b/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
&#43;deleted file mode 100644
&#43;index 4c0a8aa5d27..00000000000
&#43;--- a/src/import/staging/src/k8s.io/apiserver/pkg/endpoints/metrics/metrics_test.go
&#43;&#43;&#43;&#43; /dev/null
&#43;@@ -1,54 &#43;0,0 @@
&#43;-/*
&#43;-Copyright 2015 The Kubernetes Authors.
&#43;-
&#43;-Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
&#43;-you may not use this file except in compliance with the License.
&#43;-You may obtain a copy of the License at
&#43;-
&#43;-    <a class="moz-txt-link-freetext" href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a>
&#43;-
&#43;-Unless required by applicable law or agreed to in writing, software
&#43;-distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
&#43;-WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
&#43;-See the License for the specific language governing permissions and
&#43;-limitations under the License.
&#43;-*/
&#43;-
&#43;-package metrics
&#43;-
&#43;-import &quot;testing&quot;
&#43;-
&#43;-func TestCleanUserAgent(t *testing.T) {
&#43;-      panicBuf := []byte{198, 73, 129, 133, 90, 216, 104, 29, 13, 134, 209, 233, 30, 0, 22}
&#43;-
&#43;-      for _, tc := range []struct {
&#43;-              In  string
&#43;-              Out string
&#43;-      }{
&#43;-              {
&#43;-                      In:  &quot;Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36&quot;,
&#43;-                      Out: &quot;Browser&quot;,
&#43;-              },
&#43;-              {
&#43;-                      In:  &quot;kubectl/v1.2.4&quot;,
&#43;-                      Out: &quot;kubectl/v1.2.4&quot;,
&#43;-              },
&#43;-              {
&#43;-                      In:  `C:\Users\Kubernetes\kubectl.exe/v1.5.4`,
&#43;-                      Out: &quot;kubectl.exe/v1.5.4&quot;,
&#43;-              },
&#43;-              {
&#43;-                      In:  `C:\Program Files\kubectl.exe/v1.5.4`,
&#43;-                      Out: &quot;kubectl.exe/v1.5.4&quot;,
&#43;-              },
&#43;-              {
&#43;-                      // This malicious input courtesy of enisoc.
&#43;-                      In:  string(panicBuf) &#43; &quot;kubectl.exe&quot;,
&#43;-                      Out: &quot;kubectl.exe&quot;,
&#43;-              },
&#43;-      } {
&#43;-              if cleanUserAgent(tc.In) != tc.Out {
&#43;-                      t.Errorf(&quot;Failed to clean User-Agent: %s&quot;, tc.In)
&#43;-              }
&#43;-      }
&#43;-}
&#43;--
&#43;2.17.1
&#43;
diff --git a/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch b/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch
new file mode 100644
index 0000000..2688797
--- /dev/null
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes/0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch
@@ -0,0 &#43;1,825 @@
&#43;From a290fe55cb2f4593eb4ec5bf410cd77b9d925464 Mon Sep 17 00:00:00 2001
&#43;From: CJ Cullen <a class="moz-txt-link-rfc2396E" href="mailto:cjcullen@google.com">&lt;cjcullen@google.com&gt;</a>
&#43;Date: Wed, 22 Jan 2020 11:32:39 -0800
&#43;Subject: [PATCH] update gopkg.in/yaml.v2 to v2.2.8
&#43;
&#43;Upstream Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/kubernetes/kubernetes/pull/87637/commits/a290fe55cb2f4593eb4ec5bf410cd77b9d925464">https://github.com/kubernetes/kubernetes/pull/87637/commits/a290fe55cb2f4593eb4ec5bf410cd77b9d925464</a>]
&#43;CVE: CVE-2019-11254
&#43;
&#43;Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
&#43;---
&#43; go.mod                                        |   4 &#43;-
&#43; go.sum                                        |   4 &#43;-
&#43; staging/src/k8s.io/api/go.sum                 |   4 &#43;-
&#43; .../src/k8s.io/apiextensions-apiserver/go.mod |   2 &#43;-
&#43; .../src/k8s.io/apiextensions-apiserver/go.sum |   2 &#43;
&#43; staging/src/k8s.io/apimachinery/go.mod        |   2 &#43;-
&#43; staging/src/k8s.io/apimachinery/go.sum        |   4 &#43;-
&#43; staging/src/k8s.io/apiserver/go.mod           |   2 &#43;-
&#43; staging/src/k8s.io/apiserver/go.sum           |   4 &#43;-
&#43; staging/src/k8s.io/cli-runtime/go.sum         |   4 &#43;-
&#43; staging/src/k8s.io/client-go/go.sum           |   4 &#43;-
&#43; staging/src/k8s.io/cloud-provider/go.sum      |   4 &#43;-
&#43; staging/src/k8s.io/cluster-bootstrap/go.sum   |   4 &#43;-
&#43; staging/src/k8s.io/code-generator/go.mod      |   2 &#43;-
&#43; staging/src/k8s.io/code-generator/go.sum      |   4 &#43;-
&#43; staging/src/k8s.io/component-base/go.sum      |   4 &#43;-
&#43; staging/src/k8s.io/cri-api/go.mod             |   2 &#43;-
&#43; staging/src/k8s.io/cri-api/go.sum             |   4 &#43;-
&#43; staging/src/k8s.io/csi-translation-lib/go.sum |   4 &#43;-
&#43; staging/src/k8s.io/kube-aggregator/go.sum     |   4 &#43;-
&#43; .../src/k8s.io/kube-controller-manager/go.sum |   4 &#43;-
&#43; staging/src/k8s.io/kube-proxy/go.sum          |   4 &#43;-
&#43; staging/src/k8s.io/kube-scheduler/go.sum      |   4 &#43;-
&#43; staging/src/k8s.io/kubectl/go.mod             |   2 &#43;-
&#43; staging/src/k8s.io/kubectl/go.sum             |   4 &#43;-
&#43; staging/src/k8s.io/kubelet/go.sum             |   4 &#43;-
&#43; .../src/k8s.io/legacy-cloud-providers/go.sum  |   4 &#43;-
&#43; staging/src/k8s.io/metrics/go.sum             |   4 &#43;-
&#43; staging/src/k8s.io/node-api/go.sum            |   4 &#43;-
&#43; staging/src/k8s.io/sample-apiserver/go.sum    |   4 &#43;-
&#43; staging/src/k8s.io/sample-cli-plugin/go.sum   |   4 &#43;-
&#43; staging/src/k8s.io/sample-controller/go.sum   |   4 &#43;-
&#43; vendor/gopkg.in/yaml.v2/.travis.yml           |  18 &#43;--
&#43; vendor/gopkg.in/yaml.v2/decode.go             |  14 &#43;&#43;-
&#43; vendor/gopkg.in/yaml.v2/scannerc.go           | 107 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---------
&#43; vendor/gopkg.in/yaml.v2/yaml.go               |   2 &#43;-
&#43; vendor/gopkg.in/yaml.v2/yamlh.go              |   1 &#43;
&#43; vendor/modules.txt                            |   2 &#43;-
&#43; 38 files changed, 133 insertions(&#43;), 125 deletions(-)
&#43;
&#43;diff --git a/src/import/go.mod b/src/import/go.mod
&#43;index 7d515c2ffb0..28de082aa0d 100644
&#43;--- a/src/import/go.mod
&#43;&#43;&#43;&#43; b/src/import/go.mod
&#43;@@ -131,7 &#43;131,7 @@ require (
&#43;       google.golang.org/grpc v1.23.1
&#43;       gopkg.in/gcfg.v1 v1.2.0
&#43;       gopkg.in/square/go-jose.v2 v2.2.2
&#43;-      gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8
&#43;       gotest.tools v2.2.0&#43;incompatible
&#43;       gotest.tools/gotestsum v0.3.5
&#43;       honnef.co/go/tools v0.0.1-2019.2.2
&#43;@@ -518,7 &#43;518,7 @@ replace (
&#43;       gopkg.in/square/go-jose.v2 =&gt; gopkg.in/square/go-jose.v2 v2.2.2
&#43;       gopkg.in/tomb.v1 =&gt; gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7
&#43;       gopkg.in/warnings.v0 =&gt; gopkg.in/warnings.v0 v0.1.1
&#43;-      gopkg.in/yaml.v2 =&gt; gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 =&gt; gopkg.in/yaml.v2 v2.2.8
&#43;       gotest.tools =&gt; gotest.tools v2.2.0&#43;incompatible
&#43;       gotest.tools/gotestsum =&gt; gotest.tools/gotestsum v0.3.5
&#43;       grpc.go4.org =&gt; grpc.go4.org v0.0.0-20170609214715-11d0a25b4919
&#43;diff --git a/src/import/go.sum b/src/import/go.sum
&#43;index 72d79cb27b2..43aaee0e578 100644
&#43;--- a/src/import/go.sum
&#43;&#43;&#43;&#43; b/src/import/go.sum
&#43;@@ -574,8 &#43;574,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 h1:uRGJdciOHaEIrze2W8Q3AKkep
&#43; gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=
&#43; gopkg.in/warnings.v0 v0.1.1 h1:XM28wIgFzaBmeZ5dNHIpWLQpt/9DGKxk&#43;rCg/22nnYE=
&#43; gopkg.in/warnings.v0 v0.1.1/go.mod h1:jksf8JmL6Qr/oQM2OXTHunEvvTAsrWBLb6OOjuVWRNI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM&#43;P5UIEo=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; gotest.tools/gotestsum v0.3.5 h1:VePOWRsuWFYpfp/G8mbmOZKxO5T3501SEGQRUdvq7h0=
&#43;diff --git a/src/import/staging/src/k8s.io/api/go.sum b/src/importsrc/import/staging/src/k8s.io/api/go.sum
&#43;index 08ad9edc62a..73199a7c13e 100644
&#43;--- a/src/import/staging/src/k8s.io/api/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/api/go.sum
&#43;@@ -95,8 &#43;95,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
&#43; gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43; k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq&#43;BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
&#43; k8s.io/klog v1.0.0 h1:Pt&#43;yjF5aB1xDSVbau4VsWe&#43;dQNzA0qv1LlXdC2dF6Q8=
&#43;diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod b/src/importsrc/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
&#43;index 97014a76a68..499daf4ffa7 100644
&#43;--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
&#43;@@ -20,7 &#43;20,7 @@ require (
&#43;       github.com/stretchr/testify v1.4.0
&#43;       go.etcd.io/etcd v0.0.0-20191023171146-3cf2f69b5738
&#43;       google.golang.org/grpc v1.23.1
&#43;-      gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8
&#43;       k8s.io/api v0.0.0
&#43;       k8s.io/apimachinery v0.0.0
&#43;       k8s.io/apiserver v0.0.0
&#43;diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum b/src/importstaging/src/k8s.io/apiextensions-apiserver/go.sum
&#43;index 6f8bd4918ce..ef6973e4220 100644
&#43;--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
&#43;@@ -449,6 &#43;449,8 @@ gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43; gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/apimachinery/go.mod b/src/importstaging/src/k8s.io/apimachinery/go.mod
&#43;index 85bd7edfc84..569aa8941c4 100644
&#43;--- a/src/import/staging/src/k8s.io/apimachinery/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apimachinery/go.mod
&#43;@@ -30,7 &#43;30,7 @@ require (
&#43;       golang.org/x/text v0.3.2 // indirect
&#43;       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
&#43;       gopkg.in/inf.v0 v0.9.1
&#43;-      gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8
&#43;       k8s.io/klog v1.0.0
&#43;       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
&#43;       sigs.k8s.io/yaml v1.1.0
&#43;diff --git a/src/import/staging/src/k8s.io/apimachinery/go.sum b/src/importstaging/src/k8s.io/apimachinery/go.sum
&#43;index 52ad8335f42..0741a85da3f 100644
&#43;--- a/src/import/staging/src/k8s.io/apimachinery/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apimachinery/go.sum
&#43;@@ -111,8 &#43;111,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
&#43; gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43; k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq&#43;BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
&#43; k8s.io/klog v1.0.0 h1:Pt&#43;yjF5aB1xDSVbau4VsWe&#43;dQNzA0qv1LlXdC2dF6Q8=
&#43;diff --git a/src/import/staging/src/k8s.io/apiserver/go.mod b/src/importstaging/src/k8s.io/apiserver/go.mod
&#43;index 01b925bab48..6586e6680cb 100644
&#43;--- a/src/import/staging/src/k8s.io/apiserver/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiserver/go.mod
&#43;@@ -42,7 &#43;42,7 @@ require (
&#43;       google.golang.org/grpc v1.23.1
&#43;       gopkg.in/natefinch/lumberjack.v2 v2.0.0
&#43;       gopkg.in/square/go-jose.v2 v2.2.2
&#43;-      gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8
&#43;       gotest.tools v2.2.0&#43;incompatible // indirect
&#43;       k8s.io/api v0.0.0
&#43;       k8s.io/apimachinery v0.0.0
&#43;diff --git a/src/import/staging/src/k8s.io/apiserver/go.sum b/src/importstaging/src/k8s.io/apiserver/go.sum
&#43;index a9014243b34..0b216e592e4 100644
&#43;--- a/src/import/staging/src/k8s.io/apiserver/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/apiserver/go.sum
&#43;@@ -345,8 &#43;345,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM&#43;P5UIEo=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/cli-runtime/go.sum b/src/importstaging/src/k8s.io/cli-runtime/go.sum
&#43;index a5eef73070b..c6c2d0d9231 100644
&#43;--- a/src/import/staging/src/k8s.io/cli-runtime/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/cli-runtime/go.sum
&#43;@@ -234,8 &#43;234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/client-go/go.sum b/src/importstaging/src/k8s.io/client-go/go.sum
&#43;index d0df7473b3e..f8f205a69d7 100644
&#43;--- a/src/import/staging/src/k8s.io/client-go/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/client-go/go.sum
&#43;@@ -189,8 &#43;189,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/cloud-provider/go.sum b/src/importstaging/src/k8s.io/cloud-provider/go.sum
&#43;index 8ccf452dc8d..74228199881 100644
&#43;--- a/src/import/staging/src/k8s.io/cloud-provider/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/cloud-provider/go.sum
&#43;@@ -171,8 &#43;171,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum b/src/importstaging/src/k8s.io/cluster-bootstrap/go.sum
&#43;index 8d81d0563ea..4c58905c7d8 100644
&#43;--- a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
&#43;@@ -99,8 &#43;99,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
&#43; gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43; k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq&#43;BEi5rUBO/HRz0bTSXDUcqjScdoY3a9IHpCEIOOfk=
&#43; k8s.io/klog v1.0.0 h1:Pt&#43;yjF5aB1xDSVbau4VsWe&#43;dQNzA0qv1LlXdC2dF6Q8=
&#43;diff --git a/src/import/staging/src/k8s.io/code-generator/go.mod b/src/importstaging/src/k8s.io/code-generator/go.mod
&#43;index 69a9e1cd9f2..2436804e8f0 100644
&#43;--- a/src/import/staging/src/k8s.io/code-generator/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/code-generator/go.mod
&#43;@@ -18,7 &#43;18,7 @@ require (
&#43;       golang.org/x/tools v0.0.0-20190920225731-5eefd052ad72 // indirect
&#43;       gonum.org/v1/gonum v0.0.0-20190331200053-3d26580ed485
&#43;       gonum.org/v1/netlib v0.0.0-20190331212654-76723241ea4e // indirect
&#43;-      gopkg.in/yaml.v2 v2.2.4 // indirect
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8 // indirect
&#43;       k8s.io/gengo v0.0.0-20190822140433-26a664648505
&#43;       k8s.io/klog v1.0.0
&#43;       k8s.io/kube-openapi v0.0.0-20191107075043-30be4d16710a
&#43;diff --git a/src/import/staging/src/k8s.io/code-generator/go.sum b/src/importstaging/src/k8s.io/code-generator/go.sum
&#43;index 7bab2c9efd3..afc21aae562 100644
&#43;--- a/src/import/staging/src/k8s.io/code-generator/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/code-generator/go.sum
&#43;@@ -114,8 &#43;114,8 @@ gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod h1:Co6ibVJAznAaIkqp8
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4&#43;OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43; k8s.io/gengo v0.0.0-20190822140433-26a664648505 h1:ZY6yclUKVbZ&#43;SdWnkfY&#43;Je5vrMpKOxmGeKRbsXVmqYM=
&#43;diff --git a/src/import/staging/src/k8s.io/component-base/go.sum b/src/importstaging/src/k8s.io/component-base/go.sum
&#43;index b6af501ac2e..6c54e8b74e0 100644
&#43;--- a/src/import/staging/src/k8s.io/component-base/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/component-base/go.sum
&#43;@@ -210,8 &#43;210,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/cri-api/go.mod b/src/importstaging/src/k8s.io/cri-api/go.mod
&#43;index de2050e54af..4f8315dcfcc 100644
&#43;--- a/src/import/staging/src/k8s.io/cri-api/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/cri-api/go.mod
&#43;@@ -16,7 &#43;16,7 @@ require (
&#43;       google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873 // indirect
&#43;       google.golang.org/grpc v1.23.1
&#43;       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
&#43;-      gopkg.in/yaml.v2 v2.2.4 // indirect
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8 // indirect
&#43; )
&#43;
&#43; replace (
&#43;diff --git a/src/import/staging/src/k8s.io/cri-api/go.sum b/src/importstaging/src/k8s.io/cri-api/go.sum
&#43;index 880169cf1dc..5340741af79 100644
&#43;--- a/src/import/staging/src/k8s.io/cri-api/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/cri-api/go.sum
&#43;@@ -59,7 &#43;59,7 @@ gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8
&#43; gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 h1:qIbj1fsPNlZgppZ&#43;VLlY7N33q108Sa&#43;fhmuc&#43;sWQYwY=
&#43; gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum b/src/importstaging/src/k8s.io/csi-translation-lib/go.sum
&#43;index 2cb7a51b2a4..f918afd9078 100644
&#43;--- a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
&#43;@@ -154,8 &#43;154,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/kube-aggregator/go.sum b/src/importstaging/src/k8s.io/kube-aggregator/go.sum
&#43;index bfcd7b4aa8a..d29c2136442 100644
&#43;--- a/src/import/staging/src/k8s.io/kube-aggregator/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kube-aggregator/go.sum
&#43;@@ -378,8 &#43;378,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum b/src/importstaging/src/k8s.io/kube-controller-manager/go.sum
&#43;index 5303a3606b3..b238ae9cbbb 100644
&#43;--- a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
&#43;@@ -184,8 &#43;184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/kube-proxy/go.sum b/src/importstaging/src/k8s.io/kube-proxy/go.sum
&#43;index 5303a3606b3..b238ae9cbbb 100644
&#43;--- a/src/import/staging/src/k8s.io/kube-proxy/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kube-proxy/go.sum
&#43;@@ -184,8 &#43;184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/kube-scheduler/go.sum b/src/importstaging/src/k8s.io/kube-scheduler/go.sum
&#43;index 5303a3606b3..b238ae9cbbb 100644
&#43;--- a/src/import/staging/src/k8s.io/kube-scheduler/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kube-scheduler/go.sum
&#43;@@ -184,8 &#43;184,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/kubectl/go.mod b/src/importstaging/src/k8s.io/kubectl/go.mod
&#43;index e0111ac16bf..c646296ebb1 100644
&#43;--- a/src/import/staging/src/k8s.io/kubectl/go.mod
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kubectl/go.mod
&#43;@@ -34,7 &#43;34,7 @@ require (
&#43;       github.com/stretchr/testify v1.4.0
&#43;       github.com/xlab/handysort v0.0.0-20150421192137-fb3537ed64a1 // indirect
&#43;       golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456
&#43;-      gopkg.in/yaml.v2 v2.2.4
&#43;&#43;      gopkg.in/yaml.v2 v2.2.8
&#43;       gotest.tools v2.2.0&#43;incompatible // indirect
&#43;       k8s.io/api v0.0.0
&#43;       k8s.io/apimachinery v0.0.0
&#43;diff --git a/src/import/staging/src/k8s.io/kubectl/go.sum b/src/importstaging/src/k8s.io/kubectl/go.sum
&#43;index 95ba529852c..1db9943f53c 100644
&#43;--- a/src/import/staging/src/k8s.io/kubectl/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kubectl/go.sum
&#43;@@ -317,8 &#43;317,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM&#43;P5UIEo=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/kubelet/go.sum b/src/importstaging/src/k8s.io/kubelet/go.sum
&#43;index f42a61078c9..57a0c633583 100644
&#43;--- a/src/import/staging/src/k8s.io/kubelet/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/kubelet/go.sum
&#43;@@ -119,8 &#43;119,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58zS4L8KSrWD
&#43; gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum b/src/importstaging/src/k8s.io/legacy-cloud-providers/go.sum
&#43;index 99f76dac0cc..9e990dff888 100644
&#43;--- a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
&#43;@@ -340,8 &#43;340,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/metrics/go.sum b/src/importstaging/src/k8s.io/metrics/go.sum
&#43;index 99df273ff9e..d9b2c94fdbe 100644
&#43;--- a/src/import/staging/src/k8s.io/metrics/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/metrics/go.sum
&#43;@@ -211,8 &#43;211,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4&#43;OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
&#43;diff --git a/src/import/staging/src/k8s.io/node-api/go.sum b/src/importstaging/src/k8s.io/node-api/go.sum
&#43;index 77f0a21fa7d..1cb50186d99 100644
&#43;--- a/src/import/staging/src/k8s.io/node-api/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/node-api/go.sum
&#43;@@ -215,8 &#43;215,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4&#43;OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
&#43;diff --git a/src/import/staging/src/k8s.io/sample-apiserver/go.sum b/src/importstaging/src/k8s.io/sample-apiserver/go.sum
&#43;index 3ea72ac63e9..236ee4b1e88 100644
&#43;--- a/src/import/staging/src/k8s.io/sample-apiserver/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/sample-apiserver/go.sum
&#43;@@ -375,8 &#43;375,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gotest.tools v2.2.0&#43;incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG&#43;y2sxOXAzmJt81HFBacw=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43;diff --git a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum b/src/importstaging/src/k8s.io/sample-cli-plugin/go.sum
&#43;index a5eef73070b..c6c2d0d9231 100644
&#43;--- a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
&#43;@@ -234,8 &#43;234,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6rbqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=
&#43;diff --git a/src/import/staging/src/k8s.io/sample-controller/go.sum b/src/importstaging/src/k8s.io/sample-controller/go.sum
&#43;index 55fa85acf16..3b18f34b5a6 100644
&#43;--- a/src/import/staging/src/k8s.io/sample-controller/go.sum
&#43;&#43;&#43;&#43; b/src/import/staging/src/k8s.io/sample-controller/go.sum
&#43;@@ -216,8 &#43;216,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL&#43;naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
&#43; gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; gopkg.in/yaml.v2 v2.2.2 h1:ZCJp&#43;EgiOT7lHqUV2J862kp8Qj64Jo6az82&#43;3Td9dZw=
&#43; gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
&#43;-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
&#43;&#43;gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm&#43;jr3Dg1NNxqwp&#43;5A1VGuI=
&#43; honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4BRIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=
&#43; k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4&#43;OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=
&#43;diff --git a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml b/src/importvendor/gopkg.in/yaml.v2/.travis.yml
&#43;index 9f556934d8b..055480b9ef8 100644
&#43;--- a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
&#43;&#43;&#43;&#43; b/src/import/vendor/gopkg.in/yaml.v2/.travis.yml
&#43;@@ -1,12 &#43;1,16 @@
&#43; language: go
&#43;
&#43; go:
&#43;-    - 1.4
&#43;-    - 1.5
&#43;-    - 1.6
&#43;-    - 1.7
&#43;-    - 1.8
&#43;-    - 1.9
&#43;-    - tip
&#43;&#43;    - &quot;1.4.x&quot;
&#43;&#43;    - &quot;1.5.x&quot;
&#43;&#43;    - &quot;1.6.x&quot;
&#43;&#43;    - &quot;1.7.x&quot;
&#43;&#43;    - &quot;1.8.x&quot;
&#43;&#43;    - &quot;1.9.x&quot;
&#43;&#43;    - &quot;1.10.x&quot;
&#43;&#43;    - &quot;1.11.x&quot;
&#43;&#43;    - &quot;1.12.x&quot;
&#43;&#43;    - &quot;1.13.x&quot;
&#43;&#43;    - &quot;tip&quot;
&#43;
&#43; go_import_path: gopkg.in/yaml.v2
&#43;diff --git a/src/import/vendor/gopkg.in/yaml.v2/decode.go b/src/importvendor/gopkg.in/yaml.v2/decode.go
&#43;index 53108765555..129bc2a97d3 100644
&#43;--- a/src/import/vendor/gopkg.in/yaml.v2/decode.go
&#43;&#43;&#43;&#43; b/src/import/vendor/gopkg.in/yaml.v2/decode.go
&#43;@@ -319,10 &#43;319,14 @@ func (d *decoder) prepare(n *node, out reflect.Value) (newout reflect.Value, unm
&#43; }
&#43;
&#43; const (
&#43;-      // 400,000 decode operations is ~500kb of dense object declarations, or ~5kb of dense object declarations with 10000% alias expansion
&#43;&#43;      // 400,000 decode operations is ~500kb of dense object declarations, or
&#43;&#43;      // ~5kb of dense object declarations with 10000% alias expansion
&#43;       alias_ratio_range_low = 400000
&#43;-      // 4,000,000 decode operations is ~5MB of dense object declarations, or ~4.5MB of dense object declarations with 10% alias expansion
&#43;&#43;
&#43;&#43;      // 4,000,000 decode operations is ~5MB of dense object declarations, or
&#43;&#43;      // ~4.5MB of dense object declarations with 10% alias expansion
&#43;       alias_ratio_range_high = 4000000
&#43;&#43;
&#43;       // alias_ratio_range is the range over which we scale allowed alias ratios
&#43;       alias_ratio_range = float64(alias_ratio_range_high - alias_ratio_range_low)
&#43; )
&#43;@@ -784,8 &#43;788,7 @@ func (d *decoder) merge(n *node, out reflect.Value) {
&#43;       case mappingNode:
&#43;               d.unmarshal(n, out)
&#43;       case aliasNode:
&#43;-              an, ok := d.doc.anchors[n.value]
&#43;-              if ok &amp;&amp; an.kind != mappingNode {
&#43;&#43;              if n.alias != nil &amp;&amp; n.alias.kind != mappingNode {
&#43;                       failWantMap()
&#43;               }
&#43;               d.unmarshal(n, out)
&#43;@@ -794,8 &#43;797,7 @@ func (d *decoder) merge(n *node, out reflect.Value) {
&#43;               for i := len(n.children) - 1; i &gt;= 0; i-- {
&#43;                       ni := n.children[i]
&#43;                       if ni.kind == aliasNode {
&#43;-                              an, ok := d.doc.anchors[ni.value]
&#43;-                              if ok &amp;&amp; an.kind != mappingNode {
&#43;&#43;                              if ni.alias != nil &amp;&amp; ni.alias.kind != mappingNode {
&#43;                                       failWantMap()
&#43;                               }
&#43;                       } else if ni.kind != mappingNode {
&#43;diff --git a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go b/src/importvendor/gopkg.in/yaml.v2/scannerc.go
&#43;index 570b8ecd10f..0b9bb6030a0 100644
&#43;--- a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
&#43;&#43;&#43;&#43; b/src/import/vendor/gopkg.in/yaml.v2/scannerc.go
&#43;@@ -626,31 &#43;626,18 @@ func trace(args ...interface{}) func() {
&#43; func yaml_parser_fetch_more_tokens(parser *yaml_parser_t) bool {
&#43;       // While we need more tokens to fetch, do it.
&#43;       for {
&#43;-              // Check if we really need to fetch more tokens.
&#43;-              need_more_tokens := false
&#43;-
&#43;-              if parser.tokens_head == len(parser.tokens) {
&#43;-                      // Queue is empty.
&#43;-                      need_more_tokens = true
&#43;-              } else {
&#43;-                      // Check if any potential simple key may occupy the head position.
&#43;-                      if !yaml_parser_stale_simple_keys(parser) {
&#43;&#43;              if parser.tokens_head != len(parser.tokens) {
&#43;&#43;                      // If queue is non-empty, check if any potential simple key may
&#43;&#43;                      // occupy the head position.
&#43;&#43;                      head_tok_idx, ok := parser.simple_keys_by_tok[parser.tokens_parsed]
&#43;&#43;                      if !ok {
&#43;&#43;                              break
&#43;&#43;                      } else if valid, ok := yaml_simple_key_is_valid(parser, &amp;parser.simple_keys[head_tok_idx]); !ok {
&#43;                               return false
&#43;-                      }
&#43;-
&#43;-                      for i := range parser.simple_keys {
&#43;-                              simple_key := &amp;parser.simple_keys[i]
&#43;-                              if simple_key.possible &amp;&amp; simple_key.token_number == parser.tokens_parsed {
&#43;-                                      need_more_tokens = true
&#43;-                                      break
&#43;-                              }
&#43;&#43;                      } else if !valid {
&#43;&#43;                              break
&#43;                       }
&#43;               }
&#43;-
&#43;-              // We are finished.
&#43;-              if !need_more_tokens {
&#43;-                      break
&#43;-              }
&#43;               // Fetch the next token.
&#43;               if !yaml_parser_fetch_next_token(parser) {
&#43;                       return false
&#43;@@ -678,11 &#43;665,6 @@ func yaml_parser_fetch_next_token(parser *yaml_parser_t) bool {
&#43;               return false
&#43;       }
&#43;
&#43;-      // Remove obsolete potential simple keys.
&#43;-      if !yaml_parser_stale_simple_keys(parser) {
&#43;-              return false
&#43;-      }
&#43;-
&#43;       // Check the indentation level against the current column.
&#43;       if !yaml_parser_unroll_indent(parser, parser.mark.column) {
&#43;               return false
&#43;@@ -837,29 &#43;819,30 @@ func yaml_parser_fetch_next_token(parser *yaml_parser_t) bool {
&#43;               &quot;found character that cannot start any token&quot;)
&#43; }
&#43;
&#43;-// Check the list of potential simple keys and remove the positions that
&#43;-// cannot contain simple keys anymore.
&#43;-func yaml_parser_stale_simple_keys(parser *yaml_parser_t) bool {
&#43;-      // Check for a potential simple key for each flow level.
&#43;-      for i := range parser.simple_keys {
&#43;-              simple_key := &amp;parser.simple_keys[i]
&#43;-
&#43;-              // The specification requires that a simple key
&#43;-              //
&#43;-              //  - is limited to a single line,
&#43;-              //  - is shorter than 1024 characters.
&#43;-              if simple_key.possible &amp;&amp; (simple_key.mark.line &lt; parser.mark.line || simple_key.mark.index&#43;1024 &lt; parser.mark.index) {
&#43;-
&#43;-                      // Check if the potential simple key to be removed is required.
&#43;-                      if simple_key.required {
&#43;-                              return yaml_parser_set_scanner_error(parser,
&#43;-                                      &quot;while scanning a simple key&quot;, simple_key.mark,
&#43;-                                      &quot;could not find expected ':'&quot;)
&#43;-                      }
&#43;-                      simple_key.possible = false
&#43;&#43;func yaml_simple_key_is_valid(parser *yaml_parser_t, simple_key *yaml_simple_key_t) (valid, ok bool) {
&#43;&#43;      if !simple_key.possible {
&#43;&#43;              return false, true
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      // The 1.2 specification says:
&#43;&#43;      //
&#43;&#43;      //     &quot;If the ? indicator is omitted, parsing needs to see past the
&#43;&#43;      //     implicit key to recognize it as such. To limit the amount of
&#43;&#43;      //     lookahead required, the “:” indicator must appear at most 1024
&#43;&#43;      //     Unicode characters beyond the start of the key. In addition, the key
&#43;&#43;      //     is restricted to a single line.&quot;
&#43;&#43;      //
&#43;&#43;      if simple_key.mark.line &lt; parser.mark.line || simple_key.mark.index&#43;1024 &lt; parser.mark.index {
&#43;&#43;              // Check if the potential simple key to be removed is required.
&#43;&#43;              if simple_key.required {
&#43;&#43;                      return false, yaml_parser_set_scanner_error(parser,
&#43;&#43;                              &quot;while scanning a simple key&quot;, simple_key.mark,
&#43;&#43;                              &quot;could not find expected ':'&quot;)
&#43;               }
&#43;&#43;              simple_key.possible = false
&#43;&#43;              return false, true
&#43;       }
&#43;-      return true
&#43;&#43;      return true, true
&#43; }
&#43;
&#43; // Check if a simple key may start at the current position and add it if
&#43;@@ -879,13 &#43;862,14 @@ func yaml_parser_save_simple_key(parser *yaml_parser_t) bool {
&#43;                       possible:     true,
&#43;                       required:     required,
&#43;                       token_number: parser.tokens_parsed &#43; (len(parser.tokens) - parser.tokens_head),
&#43;&#43;                      mark:         parser.mark,
&#43;               }
&#43;-              simple_key.mark = parser.mark
&#43;
&#43;               if !yaml_parser_remove_simple_key(parser) {
&#43;                       return false
&#43;               }
&#43;               parser.simple_keys[len(parser.simple_keys)-1] = simple_key
&#43;&#43;              parser.simple_keys_by_tok[simple_key.token_number] = len(parser.simple_keys) - 1
&#43;       }
&#43;       return true
&#43; }
&#43;@@ -900,9 &#43;884,10 @@ func yaml_parser_remove_simple_key(parser *yaml_parser_t) bool {
&#43;                               &quot;while scanning a simple key&quot;, parser.simple_keys[i].mark,
&#43;                               &quot;could not find expected ':'&quot;)
&#43;               }
&#43;&#43;              // Remove the key from the stack.
&#43;&#43;              parser.simple_keys[i].possible = false
&#43;&#43;              delete(parser.simple_keys_by_tok, parser.simple_keys[i].token_number)
&#43;       }
&#43;-      // Remove the key from the stack.
&#43;-      parser.simple_keys[i].possible = false
&#43;       return true
&#43; }
&#43;
&#43;@@ -912,7 &#43;897,12 @@ const max_flow_level = 10000
&#43; // Increase the flow level and resize the simple key list if needed.
&#43; func yaml_parser_increase_flow_level(parser *yaml_parser_t) bool {
&#43;       // Reset the simple key on the next level.
&#43;-      parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{})
&#43;&#43;      parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{
&#43;&#43;              possible:     false,
&#43;&#43;              required:     false,
&#43;&#43;              token_number: parser.tokens_parsed &#43; (len(parser.tokens) - parser.tokens_head),
&#43;&#43;              mark:         parser.mark,
&#43;&#43;      })
&#43;
&#43;       // Increase the flow level.
&#43;       parser.flow_level&#43;&#43;
&#43;@@ -928,7 &#43;918,9 @@ func yaml_parser_increase_flow_level(parser *yaml_parser_t) bool {
&#43; func yaml_parser_decrease_flow_level(parser *yaml_parser_t) bool {
&#43;       if parser.flow_level &gt; 0 {
&#43;               parser.flow_level--
&#43;-              parser.simple_keys = parser.simple_keys[:len(parser.simple_keys)-1]
&#43;&#43;              last := len(parser.simple_keys) - 1
&#43;&#43;              delete(parser.simple_keys_by_tok, parser.simple_keys[last].token_number)
&#43;&#43;              parser.simple_keys = parser.simple_keys[:last]
&#43;       }
&#43;       return true
&#43; }
&#43;@@ -1005,6 &#43;997,8 @@ func yaml_parser_fetch_stream_start(parser *yaml_parser_t) bool {
&#43;       // Initialize the simple key stack.
&#43;       parser.simple_keys = append(parser.simple_keys, yaml_simple_key_t{})
&#43;
&#43;&#43;      parser.simple_keys_by_tok = make(map[int]int)
&#43;&#43;
&#43;       // A simple key is allowed at the beginning of the stream.
&#43;       parser.simple_key_allowed = true
&#43;
&#43;@@ -1286,7 &#43;1280,11 @@ func yaml_parser_fetch_value(parser *yaml_parser_t) bool {
&#43;       simple_key := &amp;parser.simple_keys[len(parser.simple_keys)-1]
&#43;
&#43;       // Have we found a simple key?
&#43;-      if simple_key.possible {
&#43;&#43;      if valid, ok := yaml_simple_key_is_valid(parser, simple_key); !ok {
&#43;&#43;              return false
&#43;&#43;
&#43;&#43;      } else if valid {
&#43;&#43;
&#43;               // Create the KEY token and insert it into the queue.
&#43;               token := yaml_token_t{
&#43;                       typ:        yaml_KEY_TOKEN,
&#43;@@ -1304,6 &#43;1302,7 @@ func yaml_parser_fetch_value(parser *yaml_parser_t) bool {
&#43;
&#43;               // Remove the simple key.
&#43;               simple_key.possible = false
&#43;&#43;              delete(parser.simple_keys_by_tok, simple_key.token_number)
&#43;
&#43;               // A simple key cannot follow another simple key.
&#43;               parser.simple_key_allowed = false
&#43;diff --git a/src/import/vendor/gopkg.in/yaml.v2/yaml.go b/src/importvendor/gopkg.in/yaml.v2/yaml.go
&#43;index de85aa4cdb7..89650e293ac 100644
&#43;--- a/src/import/vendor/gopkg.in/yaml.v2/yaml.go
&#43;&#43;&#43;&#43; b/src/import/vendor/gopkg.in/yaml.v2/yaml.go
&#43;@@ -89,7 &#43;89,7 @@ func UnmarshalStrict(in []byte, out interface{}) (err error) {
&#43;       return unmarshal(in, out, true)
&#43; }
&#43;
&#43;-// A Decorder reads and decodes YAML values from an input stream.
&#43;&#43;// A Decoder reads and decodes YAML values from an input stream.
&#43; type Decoder struct {
&#43;       strict bool
&#43;       parser *parser
&#43;diff --git a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go b/src/importvendor/gopkg.in/yaml.v2/yamlh.go
&#43;index e25cee563be..f6a9c8e34b1 100644
&#43;--- a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
&#43;&#43;&#43;&#43; b/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
&#43;@@ -579,6 &#43;579,7 @@ type yaml_parser_t struct {
&#43;
&#43;       simple_key_allowed bool                // May a simple key occur at the current position?
&#43;       simple_keys        []yaml_simple_key_t // The stack of simple keys.
&#43;&#43;      simple_keys_by_tok map[int]int         // possible simple_key indexes indexed by token_number
&#43;
&#43;       // Parser stuff
&#43;
&#43;diff --git a/src/import/vendor/modules.txt b/src/importvendor/modules.txt
&#43;index a51796d1ed5..a45f1cd3e3b 100644
&#43;--- a/src/import/vendor/modules.txt
&#43;&#43;&#43;&#43; b/src/import/vendor/modules.txt
&#43;@@ -1059,7 &#43;1059,7 @@ gopkg.in/square/go-jose.v2/jwt
&#43; gopkg.in/tomb.v1
&#43; # gopkg.in/warnings.v0 v0.1.1 =&gt; gopkg.in/warnings.v0 v0.1.1
&#43; gopkg.in/warnings.v0
&#43;-# gopkg.in/yaml.v2 v2.2.4 =&gt; gopkg.in/yaml.v2 v2.2.4
&#43;&#43;# gopkg.in/yaml.v2 v2.2.8 =&gt; gopkg.in/yaml.v2 v2.2.8
&#43; gopkg.in/yaml.v2
&#43; # gotest.tools v2.2.0&#43;incompatible =&gt; gotest.tools v2.2.0&#43;incompatible
&#43; gotest.tools
&#43;--
&#43;2.20.1
&#43;
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 76107af..4698874 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
&#43;&#43;&#43; b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -11,6 &#43;11,11 @@ SRCREV_kubernetes = &quot;f45fc1861acab22eb6a4697e3fb831e85ef5ff9c&quot;
 SRC_URI = &quot;git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=kubernetes \
            <a class="moz-txt-link-freetext" href="file://0001-hack-lib-golang.sh-use-CC-from-environment.patch">file://0001-hack-lib-golang.sh-use-CC-from-environment.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-cross-don-t-build-tests-by-default.patch">file://0001-cross-don-t-build-tests-by-default.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Add-new-endpoint-for-resource-metrics.patch">file://0001-Add-new-endpoint-for-resource-metrics.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch">file://0001-update-gopkg.in-yaml.v2-to-v2.2.8.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-remove-client-label-from-apiserver-request-count-met.patch">file://0001-remove-client-label-from-apiserver-request-count-met.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch">file://0001-Add-code-to-fix-kubelet-metrics-memory-issue.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Deal-with-auto-generated-files.patch">file://0001-Deal-with-auto-generated-files.patch</a> \
           &quot;

 DEPENDS &#43;= &quot;rsync-native \
--
2.24.1


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">


</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------01EB55A8D2F3BB3D02E028C9--
