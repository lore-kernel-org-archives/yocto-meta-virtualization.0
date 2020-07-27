Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.80])
 by mx.groups.io with SMTP id smtpd.web10.62186.1595873463308417293
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 11:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hFOGOXKS;
 spf=pass (domain: windriver.com, ip: 40.107.92.80, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpWYepCfNo4f18zWfQPwya0L3wK1tD+myPful9wm/198I3zsCrxm2Qah+wW8J+oxFuE686Ohzl1G2iBJe7/DsZZU6y20lWKIsFWwTHTroRTeIShz57KYzW+KHa/Hsx+V7wwHjqEl8LWUQ8nfoRkwSgXJqgf8FPkdAyzqaHVQLViRdAKEmGkwXLBAUzyjl2Eut/FgujPPQhxYN+Vk04HGINFc+qkSJkBcjUrls+mutXqvq6HbeqwY/8LNFm8cIdOY/e6nQFG9UV1+6a4U4tm0EJo+ewwwrXHXxn6u1IsAzWxdgWtMciaDyIWkXZ01A2eDZM6COOr3QFRx9BWwn6+qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWyo9QFu/rUqSE2GC46jq991ehvJZJemvSYBicKEGY=;
 b=bQClQWXtBYW1I721YJJW7UoKv7yuPM+G24AGq1DVM7tZzSkZLygCx8eKb3fq2oiwgRFtoXgH1SIZxMNYgk/CwVBtcR4TCxTwgUzoasAs3UZnQfyTKs0vb451mW/4v2N65XGnNKCOH/SuvDKTmP4ZGRYJmmesuMy96pplW9od9o7yPjqwJAFrPhcIaiOmYW6+OgA4LOQmari204WYnfXh4S90qjjTOxyUzr/qs86GNmXoQP9FlVTLoChOmqXXCpN9fiDGFxC+of68M57mdsaZgC3JWq6QpALEB7jlfKtbJd6XcP2kzgFmKWpBm4pDZMW3+PXSPD+ZsepjV5AYApBjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWyo9QFu/rUqSE2GC46jq991ehvJZJemvSYBicKEGY=;
 b=hFOGOXKS9Ek2QUZbTASRTt+yONXdZOHXZmsPIQTB6914UYmNeH2GLpJVDz59FWni2KZK8ZEktLLtcPaq977xCHogJR5y2qSdxWnhi0QklU635JahqzbyVQLNyaNgLZGN6MicWD1NPgESQNRfRKys/oBQ51sL/ebPC9xb6MF0YXg=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Mon, 27 Jul 2020 18:11:00 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::b895:2b67:c018:296c]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::b895:2b67:c018:296c%6]) with mapi id 15.20.3216.031; Mon, 27 Jul 2020
 18:11:00 +0000
Subject: Re: [meta-virtualization][PATCH] kubernetes: fix CVE-2020-8559
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20200727171316.103263-1-sakib.sajal@windriver.com>
 <CADkTA4NvxxMBgnSM883fkAHoNtQt-88TYaq3uy0eA3=izmeSYQ@mail.gmail.com>
From: sakib.sajal@windriver.com
Message-ID: <63918963-7925-af9e-aac4-dcff48cf82cd@windriver.com>
Date: Mon, 27 Jul 2020 14:10:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4NvxxMBgnSM883fkAHoNtQt-88TYaq3uy0eA3=izmeSYQ@mail.gmail.com>
X-ClientProxiedBy: QB1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::31) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (70.26.15.14) by QB1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Mon, 27 Jul 2020 18:11:00 +0000
X-Originating-IP: [70.26.15.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc872cd1-eb06-4f1f-b445-08d832586ad0
X-MS-TrafficTypeDiagnostic: DM6PR11MB4756:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4756417F4B959EBC3ABDE057F2720@DM6PR11MB4756.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g3kEywbJvWym6KNCtdMtMd0nyhRCPuKvnkIGmxffpZTH5yUmxZtAODIL222mpVMC/Fh9IDx27xD6zhXnwo2JH/9V9yLiaShsCKBAuXOey6wVOiX4wep1EbWWIKi7dGrIK0h1OwNRVDPSRH197Pr1TFPR8o13fAGLFIF9LGecv8x7dCtvYXXDHJle3UgLZorfsTCfrQRtqaD4WgPE0HX0Ak0n9WRzTnryd9zVsxARAkX80AussJzm6awe+o234DkRqDEfEwqvd+viC5MOtVRH/taLM59CPG7SzVG8W7kBzpZJgTWQDTrjEy2IiGCfxIK4HOV6pYjis2nrWFTZx72t1A/XUS9wp8OBEreU8bKhAQMSsVKqbXMOqMENuOHdu1s3KDG7CdkiCRTovOflppavZwqybeIgn6AwBEykuu+JzWyoxGxGRMtE/fK2uWwtIxEfrrYc9flsg1yKs3jxGwdEHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(2906002)(956004)(36756003)(66476007)(2616005)(52116002)(66556008)(6666004)(66946007)(86362001)(83380400001)(44832011)(966005)(26005)(8936002)(53546011)(6916009)(31686004)(16526019)(6486002)(8676002)(478600001)(5660300002)(316002)(4326008)(31696002)(186003)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Lkl/gy17n4/AXn0VVkc5AuajKmtRay3jiJ/3TJJ7s5f/j1in5ayeeQtTOFCVB3bNwN6r1p8sonjUT1aN8bZndVpZH86mPCk4MkWqS0tpdY83UH0bSH4fOdad1o6x/XS8e5ubCTjac9Ee6mUnbfiVoVr/iI3O20kZFU2hGm/eND9p6qk5ad8SlP0Mzyn/eN3f5u6YuYgnHi96iypX0AVnMwaQBe7RIt2FpmOoux2boxI5pt8LR32y/AbAa80RBe73Ba6zG3LHsqLPXoJYYaM374ebBNEgqlG+Jf+m+8mLP48dIZvvCknA8STdJKDBtWq0sJdwkIjEqAUIGQOtgyh6/ke80oE8QHVdDy+uwzTYydYWNJRQeWDWHOuBMklFBXeeiNBhC/2H4n4UdFLilpxZGNKy9ddPe9quhFWJR5N0XzGQKLRiEgsHS0X1seDB7Z4KF6wORRpg/wiNNMyoXxAEjKjNqrAxjPTlBvkDUD78z+E=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc872cd1-eb06-4f1f-b445-08d832586ad0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 18:11:00.5567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2+hmol/fM/yZ7S1KgKHNU8PYp3PoyidQdB3x3Th7/vP6QBDupq3DGjUZyHlKz8m1FQw6mbu6qyqGcI2h8PYGkfH/hWZfEE4Hv1LBl+tpGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2020-07-27 1:18 p.m., Bruce Ashfield wrote:
> On Mon, Jul 27, 2020 at 1:14 PM <sakib.sajal@windriver.com> wrote:
>
>> Backported fix to resolve CVE-2020-8559.
>>
> This is on the release 1.18 branch, it makes no sense to do a backport of
> an individual patch.
>
> We will refresh k8s again shortly, so it will be picked up by that.
>
> Bruce
>
Thanks for the information.

Sakib

>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   ...turn-proxied-redirects-to-the-client.patch | 149 ++++++++++++++++++
>>   .../kubernetes/kubernetes_git.bb              |   1 +
>>   2 files changed, 150 insertions(+)
>>   create mode 100644
>> recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
>>
>> diff --git
>> a/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
>> b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
>> new file mode 100644
>> index 0000000..c4552cd
>> --- /dev/null
>> +++
>> b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
>> @@ -0,0 +1,149 @@
>> +From 469c439ea18cb6cc58e36357b9ead15d68122341 Mon Sep 17 00:00:00 2001
>> +From: Tim Allclair <tallclair@google.com>
>> +Date: Wed, 17 Jun 2020 11:09:02 -0700
>> +Subject: [PATCH] Don't return proxied redirects to the client
>> +
>> +Upstream-Status: Backport [469c439ea18cb6cc58e36357b9ead15d68122341]
>> +CVE: CVE-2020-8559
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +
>> +---
>> + .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
>> + .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
>> + .../pkg/util/proxy/upgradeaware.go            | 10 ++++
>> + .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++++++-
>> + 4 files changed, 62 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http.go b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http.go
>> +index 7449cbb0a01..7b64e68157e 100644
>> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
>> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
>> +@@ -446,7 +446,7 @@ redirectLoop:
>> +
>> +               // Only follow redirects to the same host. Otherwise,
>> propagate the redirect response back.
>> +               if requireSameHostRedirects && location.Hostname() !=
>> originalLocation.Hostname() {
>> +-                      break redirectLoop
>> ++                      return nil, nil, fmt.Errorf("hostname mismatch:
>> expected %s, found %s", originalLocation.Hostname(), location.Hostname())
>> +               }
>> +
>> +               // Reset the connection.
>> +diff --git a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http_test.go b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http_test.go
>> +index da483c3563b..2fd3675d4fd 100644
>> +--- a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http_test.go
>> ++++ b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/net/http_test.go
>> +@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {
>> +               redirects:   []string{"/1", "/2", "/3", "/4", "/5", "/6",
>> "/7", "/8", "/9", "/10"},
>> +               expectError: true,
>> +       }, {
>> +-              desc:              "redirect to different host are
>> prevented",
>> +-              redirects:         []string{"http://example.com/foo"},
>> +-              expectedRedirects: 0,
>> ++              desc:        "redirect to different host are prevented",
>> ++              redirects:   []string{"http://example.com/foo"},
>> ++              expectError: true,
>> +       }, {
>> +-              desc:              "multiple redirect to different host
>> forbidden",
>> +-              redirects:         []string{"/1", "/2", "/3", "
>> http://example.com/foo"},
>> +-              expectedRedirects: 3,
>> ++              desc:        "multiple redirect to different host
>> forbidden",
>> ++              redirects:   []string{"/1", "/2", "/3", "
>> http://example.com/foo"},
>> ++              expectError: true,
>> +       }, {
>> +               desc:              "redirect to different port is allowed",
>> +               redirects:         []string{"http://HOST/foo"},
>> +diff --git a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>> b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>> +index d007c10b506..39c79be81bd 100644
>> +--- a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>> ++++ b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
>> +@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w
>> http.ResponseWriter, req *http.Reques
>> +               rawResponse = headerBytes
>> +       }
>> +
>> ++      // If the backend did not upgrade the request, return an error to
>> the client. If the response was
>> ++      // an error, the error is forwarded directly after the connection
>> is hijacked. Otherwise, just
>> ++      // return a generic error here.
>> ++      if backendHTTPResponse.StatusCode != http.StatusSwitchingProtocols
>> && backendHTTPResponse.StatusCode < 400 {
>> ++              err := fmt.Errorf("invalid upgrade response: status code
>> %d", backendHTTPResponse.StatusCode)
>> ++              klog.Errorf("Proxy upgrade error: %v", err)
>> ++              h.Responder.Error(w, req, err)
>> ++              return true
>> ++      }
>> ++
>> +       // Once the connection is hijacked, the ErrorResponder will no
>> longer work, so
>> +       // hijacking should be the last step in the upgrade.
>> +       requestHijacker, ok := w.(http.Hijacker)
>> +diff --git a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>> b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>> +index 710fc6a9c21..c1dfb029d93 100644
>> +--- a/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>> ++++ b/src/import/staging/src/
>> k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
>> +@@ -512,7 +512,7 @@ func (r *noErrorsAllowed) Error(w
>> http.ResponseWriter, req *http.Request, err er
>> +       r.t.Error(err)
>> + }
>> +
>> +-func TestProxyUpgradeErrorResponse(t *testing.T) {
>> ++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
>> +       var (
>> +               responder   *fakeResponder
>> +               expectedErr = errors.New("EXPECTED")
>> +@@ -560,7 +560,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {
>> +
>> + func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
>> +       for _, intercept := range []bool{true, false} {
>> +-              for _, code := range []int{200, 400, 500} {
>> ++              for _, code := range []int{400, 500} {
>> +                       t.Run(fmt.Sprintf("intercept=%v,code=%v",
>> intercept, code), func(t *testing.T) {
>> +                               // Set up a backend server
>> +                               backend := http.NewServeMux()
>> +@@ -620,6 +620,49 @@ func TestProxyUpgradeErrorResponseTerminates(t
>> *testing.T) {
>> +       }
>> + }
>> +
>> ++func TestProxyUpgradeErrorResponse(t *testing.T) {
>> ++      for _, intercept := range []bool{true, false} {
>> ++              for _, code := range []int{200, 300, 302, 307} {
>> ++                      t.Run(fmt.Sprintf("intercept=%v,code=%v",
>> intercept, code), func(t *testing.T) {
>> ++                              // Set up a backend server
>> ++                              backend := http.NewServeMux()
>> ++                              backend.Handle("/hello",
>> http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
>> ++                                      http.Redirect(w, r, "
>> https://example.com/there", code)
>> ++                              }))
>> ++                              backendServer :=
>> httptest.NewServer(backend)
>> ++                              defer backendServer.Close()
>> ++                              backendServerURL, _ :=
>> url.Parse(backendServer.URL)
>> ++                              backendServerURL.Path = "/hello"
>> ++
>> ++                              // Set up a proxy pointing to a specific
>> path on the backend
>> ++                              proxyHandler :=
>> NewUpgradeAwareHandler(backendServerURL, nil, false, false,
>> &fakeResponder{t: t})
>> ++                              proxyHandler.InterceptRedirects = intercept
>> ++                              proxyHandler.RequireSameHostRedirects =
>> true
>> ++                              proxy := httptest.NewServer(proxyHandler)
>> ++                              defer proxy.Close()
>> ++                              proxyURL, _ := url.Parse(proxy.URL)
>> ++
>> ++                              conn, err := net.Dial("tcp", proxyURL.Host)
>> ++                              require.NoError(t, err)
>> ++                              bufferedReader := bufio.NewReader(conn)
>> ++
>> ++                              // Send upgrade request resulting in a
>> non-101 response from the backend
>> ++                              req, _ := http.NewRequest("GET", "/", nil)
>> ++
>> req.Header.Set(httpstream.HeaderConnection, httpstream.HeaderUpgrade)
>> ++                              require.NoError(t, req.Write(conn))
>> ++                              // Verify we get the correct response and
>> full message body content
>> ++                              resp, err :=
>> http.ReadResponse(bufferedReader, nil)
>> ++                              require.NoError(t, err)
>> ++                              assert.Equal(t, fakeStatusCode,
>> resp.StatusCode)
>> ++                              resp.Body.Close()
>> ++
>> ++                              // clean up
>> ++                              conn.Close()
>> ++                      })
>> ++              }
>> ++      }
>> ++}
>> ++
>> + func TestDefaultProxyTransport(t *testing.T) {
>> +       tests := []struct {
>> +               name,
>> +--
>> +2.20.1
>> +
>> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
>> b/recipes-containers/kubernetes/kubernetes_git.bb
>> index d28e6a2..156e083 100644
>> --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> @@ -13,6 +13,7 @@ SRC_URI = "git://
>> github.com/kubernetes/kubernetes.git;branch=release-1.18;name=k
>>              git://
>> github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release
>> \
>>              file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>>              file://0001-cross-don-t-build-tests-by-default.patch \
>> +           file://0001-Don-t-return-proxied-redirects-to-the-client.patch
>> \
>>             "
>>
>>   DEPENDS += "rsync-native \
>> --
>> 2.17.1
>>
>> 
>>
>
