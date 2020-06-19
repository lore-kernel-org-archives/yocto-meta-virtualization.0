Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.5984.1592571275862786344
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jun 2020 05:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L6dkE6QP;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id y6so7529908edi.3;
        Fri, 19 Jun 2020 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qpTelBgyWb9nuCqEnGNWXF3akT5xrE3SIIIVYE04MLM=;
        b=L6dkE6QPtj5FC/7QpdKo1qvBqYDKRL2Y4FdcsS/bma3myBMUtWPVDcrFSu4x4Gb4bw
         aPqIxQ6Z3ju6zQUGxN123p1vxez37VeuVfV7pXhpNGXQLfjorc1ALKK0KK011JCTRR+0
         AlsG/mgH3PwSgfoDAayZAIBbdJGf/CdOdhEF4jARwp6KSnAeKuouvjAxFsogFmLvR8JW
         1tuMRkdSmYJL/eQ4WEqNdYZmuYAms6Z8fxsNp7LLS1XksVmm1/bl3iE8ZPcvR3B7kIEH
         noSlrKCazBsgJn7xYhiUKEYVD+ZPTcIliW5KedioeN7vESz4HDuurqep6tAJFQFpmC2c
         PIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qpTelBgyWb9nuCqEnGNWXF3akT5xrE3SIIIVYE04MLM=;
        b=MdUBSyLznExpr+DCO9ktBMjvMZRKMkKUNiOa0fcYG6BT4PmlBuw36WKMVhjSjTe70B
         9SkY592GMchwRGsJECDDWmcb9ubXyQXkcqpEoNUJ/q7vE4gmKh2uAsH0KP+wDJ58pthw
         WgM4gDqohgjZv36SeKr1Arsbx2XNCgf/ImyVMqL3zaGiuT2rEIG3kS6kg/qniVpHXBlr
         kvV31SogVB3DjAqpxqRDBFHeMpR6bymSwXtCS8EjIfkbA7iaKO7JpAyHt1kRA7oYjyF3
         28bbIfPOG4+xTPQAXN3YJ+Q8yKBMzMxuhdNhuPhJPmC3Xpv7MUsLktcj64ZoM51bAXFQ
         LkLw==
X-Gm-Message-State: AOAM533Kw5GaT1+jtc0d26rAuShCnKcfPwhtcRkeguZxgMEaFvBEVzvn
	oyyyPV+Zm5jRwe2mF4T0HP7LMQ5nDW7bjLY/knY=
X-Google-Smtp-Source: ABdhPJzTw0MO3vExBUzoa7Zkzw7G3jGdRGDxHHL+m0qipt/jdq6ebRhBmWF7jbyy9D6dqh/whX7sDH0mn0W9l9L/cMA=
X-Received: by 2002:a50:c181:: with SMTP id m1mr3053917edf.27.1592571273987;
 Fri, 19 Jun 2020 05:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200618073419.154522-1-zhixiong.chi@windriver.com>
 <CADkTA4NGXKpLaM4tc8r-kf_s1oofYbAR+eshAZ3ENrTCLhVS4g@mail.gmail.com> <39d90201-3023-539f-11d7-e3f19340fde1@windriver.com>
In-Reply-To: <39d90201-3023-539f-11d7-e3f19340fde1@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Jun 2020 08:54:21 -0400
Message-ID: <CADkTA4OEki0BiqfR+xJHTrK4U5WGC2Swr4okZhDO=GgCQRg2WA@mail.gmail.com>
Subject: Re: [yocto][meta-virtualization][zeus][PATCH] kubernetes: CVE-2019-11254
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: yocto <yocto@lists.yoctoproject.org>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 10:28 PM Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
>
>
> On 2020/6/18 =E4=B8=8B=E5=8D=888:49, Bruce Ashfield wrote:
>
> This should go to the meta-virt mailing list.
>
> But you still haven't answered my question from the last k8s CVE patch:
>
> "Can you confirm that the k8s versions in master/dunfell don't have this
> CVE ?"
>
>
> Hi Bruce,
>
> Sorry for that, it's possible that there is something wrong with our mail=
 server. I just saw your response a few minute ago.
>
> For the master/dunfell branch, since we always upgrade the version to cov=
er some issues,
>
> as a result some CVE patches will be droped after upgrading, so our yocto=
-team developer will
>
> focus on the CVE cases for master branch if the upstream haven't updated =
the version for a long time.
>
> And they will send the request review to the two branchs.
>
> As you known, the sustaining team just send the CVE patches to ZEUS LTS b=
ranch if our yocto colleague
>
> work on the master branch, at the same time this rule of our team just ap=
plies to the CVE issues.
>

Sounds good.

And yes, in master I prefer to upgrade the version and I typically do
those upgrades every 2 months.

For the CVE patches, it is just helpful if we explicitly list the
impacted versions, so I can easily check the version in master.
Alternatively, just mentioning which branches are / are not impacted
by an issue is enough.

>
> For meta-virtualization mail-list, Do I need to send the request review a=
gain?

Nope. I have it in my queue and will take care of it shortly.

Bruce

>
>
> Zhixiong
>
> Bruce
>
> On Thu, Jun 18, 2020 at 3:34 AM Zhixiong Chi <zhixiong.chi@windriver.com>=
 wrote:
>
> Backport the CVE patch from the upstream:
> https://github.com/kubernetes/kubernetes.git
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../kubernetes/CVE-2019-11254.patch           | 797 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 798 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2019-112=
54.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2019-11254.patc=
h b/recipes-containers/kubernetes/kubernetes/CVE-2019-11254.patch
> new file mode 100644
> index 0000000..2d991a9
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2019-11254.patch
> @@ -0,0 +1,797 @@
> +From e9ba264d57d379d86dfbf3ae94e82eb0ead9c468 Mon Sep 17 00:00:00 2001
> +From: CJ Cullen <cjcullen@google.com>
> +Date: Wed, 22 Jan 2020 11:32:39 -0800
> +Subject: [PATCH] update gopkg.in/yaml.v2 to v2.2.8
> +
> +CVE: CVE-2019-11254
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes.git =
branch: release-1.16]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + src/import/go.mod                                       |   4 +-
> + src/import/go.sum                                       |   4 +-
> + src/import/staging/src/k8s.io/api/go.sum                 |   4 +-
> + .../src/k8s.io/apiextensions-apiserver/go.mod           |   2 +-
> + .../src/k8s.io/apiextensions-apiserver/go.sum           |   4 +-
> + src/import/staging/src/k8s.io/apimachinery/go.mod        |   2 +-
> + src/import/staging/src/k8s.io/apimachinery/go.sum        |   4 +-
> + src/import/staging/src/k8s.io/apiserver/go.mod           |   2 +-
> + src/import/staging/src/k8s.io/apiserver/go.sum           |   4 +-
> + src/import/staging/src/k8s.io/cli-runtime/go.sum         |   4 +-
> + src/import/staging/src/k8s.io/client-go/go.sum           |   4 +-
> + src/import/staging/src/k8s.io/cloud-provider/go.sum      |   4 +-
> + src/import/staging/src/k8s.io/cluster-bootstrap/go.sum   |   4 +-
> + src/import/staging/src/k8s.io/code-generator/go.mod      |   2 +-
> + src/import/staging/src/k8s.io/code-generator/go.sum      |   4 +-
> + src/import/staging/src/k8s.io/component-base/go.sum      |   4 +-
> + src/import/staging/src/k8s.io/csi-translation-lib/go.sum |   4 +-
> + src/import/staging/src/k8s.io/kube-aggregator/go.sum     |   4 +-
> + .../src/k8s.io/kube-controller-manager/go.sum           |   4 +-
> + src/import/staging/src/k8s.io/kube-proxy/go.sum          |   4 +-
> + src/import/staging/src/k8s.io/kube-scheduler/go.sum      |   4 +-
> + src/import/staging/src/k8s.io/kubectl/go.mod             |   2 +-
> + src/import/staging/src/k8s.io/kubectl/go.sum             |   4 +-
> + src/import/staging/src/k8s.io/kubelet/go.sum             |   4 +-
> + .../src/k8s.io/legacy-cloud-providers/go.sum            |   4 +-
> + src/import/staging/src/k8s.io/metrics/go.sum             |   4 +-
> + src/import/staging/src/k8s.io/node-api/go.sum            |   4 +-
> + src/import/staging/src/k8s.io/sample-apiserver/go.sum    |   4 +-
> + src/import/staging/src/k8s.io/sample-cli-plugin/go.sum   |   4 +-
> + src/import/staging/src/k8s.io/sample-controller/go.sum   |   4 +-
> + src/import/vendor/gopkg.in/yaml.v2/.travis.yml           |  18 +--
> + src/import/vendor/gopkg.in/yaml.v2/decode.go             |  14 ++-
> + src/import/vendor/gopkg.in/yaml.v2/scannerc.go           | 107 ++++++++=
+---------
> + src/import/vendor/gopkg.in/yaml.v2/yaml.go               |   2 +-
> + src/import/vendor/gopkg.in/yaml.v2/yamlh.go              |   1 +
> + src/import/vendor/modules.txt                            |   2 +-
> + 36 files changed, 130 insertions(+), 124 deletions(-)
> +
> +diff --git a/src/import/go.mod b/go.mod
> +index cf8c9147e62..884870f8843 100644
> +--- a/src/import/go.mod
> ++++ b/src/import/go.mod
> +@@ -139,7 +139,7 @@ require (
> +       google.golang.org/grpc v1.23.0
> +       gopkg.in/gcfg.v1 v1.2.0
> +       gopkg.in/square/go-jose.v2 v2.2.2
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible
> +       gotest.tools/gotestsum v0.3.5
> +       honnef.co/go/tools v0.0.1-2019.2.2
> +@@ -444,7 +444,7 @@ replace (
> +       gopkg.in/square/go-jose.v2 =3D> gopkg.in/square/go-jose.v2 v2.2.2
> +       gopkg.in/tomb.v1 =3D> gopkg.in/tomb.v1 v1.0.0-20141024135613-dd63=
2973f1e7
> +       gopkg.in/warnings.v0 =3D> gopkg.in/warnings.v0 v0.1.1
> +-      gopkg.in/yaml.v2 =3D> gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 =3D> gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools =3D> gotest.tools v2.2.0+incompatible
> +       gotest.tools/gotestsum =3D> gotest.tools/gotestsum v0.3.5
> +       honnef.co/go/tools =3D> honnef.co/go/tools v0.0.1-2019.2.2
> +diff --git a/src/import/go.sum b/src/import/go.sum
> +index b5e3f74686f..617081d2d9e 100644
> +--- a/src/import/go.sum
> ++++ b/src/import/go.sum
> +@@ -492,8 +492,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 =
h1:uRGJdciOHaEIrze2W8Q3AKkep
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58z=
S4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/warnings.v0 v0.1.1 h1:XM28wIgFzaBmeZ5dNHIpWLQpt/9DGKxk+rCg/22n=
nYE=3D
> + gopkg.in/warnings.v0 v0.1.1/go.mod h1:jksf8JmL6Qr/oQM2OXTHunEvvTAsrWBLb=
6OOjuVWRNI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjf=
M+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + gotest.tools/gotestsum v0.3.5 h1:VePOWRsuWFYpfp/G8mbmOZKxO5T3501SEGQRUd=
vq7h0=3D
> +diff --git a/src/import/staging/src/k8s.io/api/go.sum b/src/import/stagi=
ng/src/k8s.io/api/go.sum
> +index c162d16011e..8ac86891676 100644
> +--- a/src/import/staging/src/k8s.io/api/go.sum
> ++++ b/src/import/staging/src/k8s.io/api/go.sum
> +@@ -90,8 +90,8 @@ gopkg.in/inf.v0 v0.9.1/go.mod h1:cWUDdTG/fYaXco+Dcufb5=
Vnc6Gp2YChqWtbxRZE0mXw=3D
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58z=
S4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HR=
z0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v0.4.0 h1:lCJCxf/LIowc2IGS9TPjWDyXY4nOmdGdfcwwDQCOURQ=3D
> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mo=
d b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> +index f2cc6ca100f..41289345ad7 100644
> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.mod
> +@@ -21,7 +21,7 @@ require (
> +       github.com/spf13/pflag v1.0.3
> +       github.com/stretchr/testify v1.3.0
> +       google.golang.org/grpc v1.23.0
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +       k8s.io/apiserver v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.su=
m b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
> +index 853644fbe6d..1c4460fdc38 100644
> +--- a/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/apiextensions-apiserver/go.sum
> +@@ -349,8 +349,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.mod b/src/imp=
ort/staging/src/k8s.io/apimachinery/go.mod
> +index 5b49085be74..bdd9ed2f63d 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/go.mod
> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.mod
> +@@ -30,7 +30,7 @@ require (
> +       golang.org/x/text v0.3.2 // indirect
> +       gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127 // indirect
> +       gopkg.in/inf.v0 v0.9.0
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       k8s.io/klog v0.4.0
> +       k8s.io/kube-openapi v0.0.0-20190816220812-743ec37842bf
> +       sigs.k8s.io/yaml v1.1.0
> +diff --git a/src/import/staging/src/k8s.io/apimachinery/go.sum b/src/imp=
ort/staging/src/k8s.io/apimachinery/go.sum
> +index 916261e42c0..636ef5751ea 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/go.sum
> ++++ b/src/import/staging/src/k8s.io/apimachinery/go.sum
> +@@ -106,8 +106,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 =
h1:uRGJdciOHaEIrze2W8Q3AKkep
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58z=
S4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HR=
z0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v0.4.0 h1:lCJCxf/LIowc2IGS9TPjWDyXY4nOmdGdfcwwDQCOURQ=3D
> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.mod b/src/import=
/staging/src/k8s.io/apiserver/go.mod
> +index 8f97b49b06a..e1fdb94df10 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/go.mod
> ++++ b/src/import/staging/src/k8s.io/apiserver/go.mod
> +@@ -47,7 +47,7 @@ require (
> +       google.golang.org/grpc v1.23.0
> +       gopkg.in/natefinch/lumberjack.v2 v2.0.0
> +       gopkg.in/square/go-jose.v2 v2.2.2
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible // indirect
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/apiserver/go.sum b/src/import=
/staging/src/k8s.io/apiserver/go.sum
> +index 9658ae1784a..d055f0d08a2 100644
> +--- a/src/import/staging/src/k8s.io/apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/apiserver/go.sum
> +@@ -268,8 +268,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjf=
M+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/cli-runtime/go.sum b/src/impo=
rt/staging/src/k8s.io/cli-runtime/go.sum
> +index 71af2c05905..641ba432230 100644
> +--- a/src/import/staging/src/k8s.io/cli-runtime/go.sum
> ++++ b/src/import/staging/src/k8s.io/cli-runtime/go.sum
> +@@ -207,8 +207,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/client-go/go.sum b/src/import=
/staging/src/k8s.io/client-go/go.sum
> +index ec7d3780cad..315bfceda79 100644
> +--- a/src/import/staging/src/k8s.io/client-go/go.sum
> ++++ b/src/import/staging/src/k8s.io/client-go/go.sum
> +@@ -175,8 +175,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/cloud-provider/go.sum b/src/i=
mport/staging/src/k8s.io/cloud-provider/go.sum
> +index e00d8e24a27..7d446c66231 100644
> +--- a/src/import/staging/src/k8s.io/cloud-provider/go.sum
> ++++ b/src/import/staging/src/k8s.io/cloud-provider/go.sum
> +@@ -158,8 +158,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum b/sr=
c/import/staging/src/k8s.io/cluster-bootstrap/go.sum
> +index 09c98a9ccd8..e148b9741de 100644
> +--- a/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
> ++++ b/src/import/staging/src/k8s.io/cluster-bootstrap/go.sum
> +@@ -91,8 +91,8 @@ gopkg.in/square/go-jose.v2 v2.2.2/go.mod h1:M9dMgbHiYL=
oDGQrXy7OpJDJWiKiU//h+vD76
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58z=
S4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HR=
z0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v0.4.0 h1:lCJCxf/LIowc2IGS9TPjWDyXY4nOmdGdfcwwDQCOURQ=3D
> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.mod b/src/i=
mport/staging/src/k8s.io/code-generator/go.mod
> +index 7717cae18ba..0dc05a6c181 100644
> +--- a/src/import/staging/src/k8s.io/code-generator/go.mod
> ++++ b/src/import/staging/src/k8s.io/code-generator/go.mod
> +@@ -15,7 +15,7 @@ require (
> +       golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac // indirect
> +       gonum.org/v1/gonum v0.0.0-20190331200053-3d26580ed485
> +       gonum.org/v1/netlib v0.0.0-20190331212654-76723241ea4e // indirec=
t
> +-      gopkg.in/yaml.v2 v2.2.4 // indirect
> ++      gopkg.in/yaml.v2 v2.2.8 // indirect
> +       k8s.io/gengo v0.0.0-20190822140433-26a664648505
> +       k8s.io/klog v0.4.0
> +       k8s.io/kube-openapi v0.0.0-20190816220812-743ec37842bf
> +diff --git a/src/import/staging/src/k8s.io/code-generator/go.sum b/src/i=
mport/staging/src/k8s.io/code-generator/go.sum
> +index a34b8497afa..a3be7c382b8 100644
> +--- a/src/import/staging/src/k8s.io/code-generator/go.sum
> ++++ b/src/import/staging/src/k8s.io/code-generator/go.sum
> +@@ -103,8 +103,8 @@ gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127=
/go.mod h1:Co6ibVJAznAaIkqp8
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZK=
jQ04WJ6EhQQVFdjOFvCazDk=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/gengo v0.0.0-20190822140433-26a664648505 h1:ZY6yclUKVbZ+SdWnkfY+=
Je5vrMpKOxmGeKRbsXVmqYM=3D
> +diff --git a/src/import/staging/src/k8s.io/component-base/go.sum b/src/i=
mport/staging/src/k8s.io/component-base/go.sum
> +index 34151a5846d..155e3e420e9 100644
> +--- a/src/import/staging/src/k8s.io/component-base/go.sum
> ++++ b/src/import/staging/src/k8s.io/component-base/go.sum
> +@@ -171,8 +171,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum b/=
src/import/staging/src/k8s.io/csi-translation-lib/go.sum
> +index 71646a53606..a4de3199c55 100644
> +--- a/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
> ++++ b/src/import/staging/src/k8s.io/csi-translation-lib/go.sum
> +@@ -139,8 +139,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-aggregator/go.sum b/src/=
import/staging/src/k8s.io/kube-aggregator/go.sum
> +index 306beb4d2c1..be07875a640 100644
> +--- a/src/import/staging/src/k8s.io/kube-aggregator/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-aggregator/go.sum
> +@@ -303,8 +303,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-controller-manager/go.su=
m b/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
> +index 346871c01de..1653f3eca5a 100644
> +--- a/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-controller-manager/go.sum
> +@@ -147,8 +147,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-proxy/go.sum b/src/impor=
t/staging/src/k8s.io/kube-proxy/go.sum
> +index 346871c01de..1653f3eca5a 100644
> +--- a/src/import/staging/src/k8s.io/kube-proxy/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-proxy/go.sum
> +@@ -147,8 +147,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kube-scheduler/go.sum b/src/i=
mport/staging/src/k8s.io/kube-scheduler/go.sum
> +index 346871c01de..1653f3eca5a 100644
> +--- a/src/import/staging/src/k8s.io/kube-scheduler/go.sum
> ++++ b/src/import/staging/src/k8s.io/kube-scheduler/go.sum
> +@@ -147,8 +147,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.mod b/src/import/s=
taging/src/k8s.io/kubectl/go.mod
> +index 5e5e4b2bbed..d1c8a52cbb4 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/go.mod
> ++++ b/src/import/staging/src/k8s.io/kubectl/go.mod
> +@@ -33,7 +33,7 @@ require (
> +       github.com/spf13/pflag v1.0.3
> +       github.com/stretchr/testify v1.3.0
> +       golang.org/x/sys v0.0.0-20190616124812-15dcb6c0061f
> +-      gopkg.in/yaml.v2 v2.2.4
> ++      gopkg.in/yaml.v2 v2.2.8
> +       gotest.tools v2.2.0+incompatible // indirect
> +       k8s.io/api v0.0.0
> +       k8s.io/apimachinery v0.0.0
> +diff --git a/src/import/staging/src/k8s.io/kubectl/go.sum b/src/import/s=
taging/src/k8s.io/kubectl/go.sum
> +index b164ecd3dc3..17d56a30001 100644
> +--- a/src/import/staging/src/k8s.io/kubectl/go.sum
> ++++ b/src/import/staging/src/k8s.io/kubectl/go.sum
> +@@ -268,8 +268,8 @@ gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/=
go.mod h1:dt/ZhP58zS4L8KSrWD
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjf=
M+P5UIEo=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/kubelet/go.sum b/src/import/s=
taging/src/k8s.io/kubelet/go.sum
> +index 0635238e2ce..e12860540cd 100644
> +--- a/src/import/staging/src/k8s.io/kubelet/go.sum
> ++++ b/src/import/staging/src/k8s.io/kubelet/go.sum
> +@@ -87,8 +87,8 @@ gopkg.in/inf.v0 v0.9.1/go.mod h1:cWUDdTG/fYaXco+Dcufb5=
Vnc6Gp2YChqWtbxRZE0mXw=3D
> + gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod h1:dt/ZhP58z=
S4L8KSrWDmTeBkI65Dw0HsyUHuEVlX15mw=3D
> + gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91YhliOondGd6ZrsDBHQE=
=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> + k8s.io/klog v0.0.0-20181102134211-b9b56d5dfc92/go.mod h1:Gq+BEi5rUBO/HR=
z0bTSXDUcqjScdoY3a9IHpCEIOOfk=3D
> + k8s.io/klog v0.4.0 h1:lCJCxf/LIowc2IGS9TPjWDyXY4nOmdGdfcwwDQCOURQ=3D
> +diff --git a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum=
 b/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
> +index 7da7d10f1b0..4affb42e698 100644
> +--- a/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
> ++++ b/src/import/staging/src/k8s.io/legacy-cloud-providers/go.sum
> +@@ -271,8 +271,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/metrics/go.sum b/src/import/s=
taging/src/k8s.io/metrics/go.sum
> +index 4ba35f7c725..b820dfe346b 100644
> +--- a/src/import/staging/src/k8s.io/metrics/go.sum
> ++++ b/src/import/staging/src/k8s.io/metrics/go.sum
> +@@ -192,8 +192,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZK=
jQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/staging/src/k8s.io/node-api/go.sum b/src/import/=
staging/src/k8s.io/node-api/go.sum
> +index eb2113416f4..df4095e8c53 100644
> +--- a/src/import/staging/src/k8s.io/node-api/go.sum
> ++++ b/src/import/staging/src/k8s.io/node-api/go.sum
> +@@ -195,8 +195,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZK=
jQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-apiserver/go.sum b/src=
/import/staging/src/k8s.io/sample-apiserver/go.sum
> +index 6100b600021..c9af593485a 100644
> +--- a/src/import/staging/src/k8s.io/sample-apiserver/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-apiserver/go.sum
> +@@ -300,8 +300,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gotest.tools v2.2.0+incompatible/go.mod h1:DsYFclhRJ6vuDpmuTbkuFWG+y2sx=
OXAzmJt81HFBacw=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum b/sr=
c/import/staging/src/k8s.io/sample-cli-plugin/go.sum
> +index 71af2c05905..641ba432230 100644
> +--- a/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-cli-plugin/go.sum
> +@@ -207,8 +207,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6/go.mod h1:ezvh/TsK7cY6r=
bqRK0oQQ8IAqLxYwwyPxAX1Pzy0ii0=3D
> +diff --git a/src/import/staging/src/k8s.io/sample-controller/go.sum b/sr=
c/import/staging/src/k8s.io/sample-controller/go.sum
> +index 2729443484f..9d360830a5a 100644
> +--- a/src/import/staging/src/k8s.io/sample-controller/go.sum
> ++++ b/src/import/staging/src/k8s.io/sample-controller/go.sum
> +@@ -196,8 +196,8 @@ gopkg.in/yaml.v2 v2.2.1 h1:mUhvW9EsL+naU5Q3cakzfE91Y=
hliOondGd6ZrsDBHQE=3D
> + gopkg.in/yaml.v2 v2.2.1/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + gopkg.in/yaml.v2 v2.2.2 h1:ZCJp+EgiOT7lHqUV2J862kp8Qj64Jo6az82+3Td9dZw=
=3D
> + gopkg.in/yaml.v2 v2.2.2/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> +-gopkg.in/yaml.v2 v2.2.4 h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=
=3D
> +-gopkg.in/yaml.v2 v2.2.4/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> ++gopkg.in/yaml.v2 v2.2.8 h1:obN1ZagJSUGI0Ek/LBmuj4SNLPfIny3KsKFopxRdj10=
=3D
> ++gopkg.in/yaml.v2 v2.2.8/go.mod h1:hI93XBmqTisBFMUTm0b8Fm+jr3Dg1NNxqwp+5=
A1VGuI=3D
> + honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod h1:rf3lG4B=
RIbNafJWhAfAdb/ePZxsR/4RtNHQocxwk9r4=3D
> + k8s.io/gengo v0.0.0-20190128074634-0689ccc1d7d6 h1:4s3/R4+OYYYUKptXPhZK=
jQ04WJ6EhQQVFdjOFvCazDk=3D
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/.travis.yml b/src/import=
/vendor/gopkg.in/yaml.v2/.travis.yml
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
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/decode.go b/src/import/v=
endor/gopkg.in/yaml.v2/decode.go
> +index 53108765555..129bc2a97d3 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/decode.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/decode.go
> +@@ -319,10 +319,14 @@ func (d *decoder) prepare(n *node, out reflect.Val=
ue) (newout reflect.Value, unm
> + }
> +
> + const (
> +-      // 400,000 decode operations is ~500kb of dense object declaratio=
ns, or ~5kb of dense object declarations with 10000% alias expansion
> ++      // 400,000 decode operations is ~500kb of dense object declaratio=
ns, or
> ++      // ~5kb of dense object declarations with 10000% alias expansion
> +       alias_ratio_range_low =3D 400000
> +-      // 4,000,000 decode operations is ~5MB of dense object declaratio=
ns, or ~4.5MB of dense object declarations with 10% alias expansion
> ++
> ++      // 4,000,000 decode operations is ~5MB of dense object declaratio=
ns, or
> ++      // ~4.5MB of dense object declarations with 10% alias expansion
> +       alias_ratio_range_high =3D 4000000
> ++
> +       // alias_ratio_range is the range over which we scale allowed ali=
as ratios
> +       alias_ratio_range =3D float64(alias_ratio_range_high - alias_rati=
o_range_low)
> + )
> +@@ -784,8 +788,7 @@ func (d *decoder) merge(n *node, out reflect.Value) =
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
> +@@ -794,8 +797,7 @@ func (d *decoder) merge(n *node, out reflect.Value) =
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
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/scannerc.go b/src/import=
/vendor/gopkg.in/yaml.v2/scannerc.go
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
> +-                      // Check if any potential simple key may occupy t=
he head position.
> +-                      if !yaml_parser_stale_simple_keys(parser) {
> ++              if parser.tokens_head !=3D len(parser.tokens) {
> ++                      // If queue is non-empty, check if any potential =
simple key may
> ++                      // occupy the head position.
> ++                      head_tok_idx, ok :=3D parser.simple_keys_by_tok[p=
arser.tokens_parsed]
> ++                      if !ok {
> ++                              break
> ++                      } else if valid, ok :=3D yaml_simple_key_is_valid=
(parser, &parser.simple_keys[head_tok_idx]); !ok {
> +                               return false
> +-                      }
> +-
> +-                      for i :=3D range parser.simple_keys {
> +-                              simple_key :=3D &parser.simple_keys[i]
> +-                              if simple_key.possible && simple_key.toke=
n_number =3D=3D parser.tokens_parsed {
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
> +@@ -678,11 +665,6 @@ func yaml_parser_fetch_next_token(parser *yaml_pars=
er_t) bool {
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
> +@@ -837,29 +819,30 @@ func yaml_parser_fetch_next_token(parser *yaml_par=
ser_t) bool {
> +               "found character that cannot start any token")
> + }
> +
> +-// Check the list of potential simple keys and remove the positions tha=
t
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
> +-              if simple_key.possible && (simple_key.mark.line < parser.=
mark.line || simple_key.mark.index+1024 < parser.mark.index) {
> +-
> +-                      // Check if the potential simple key to be remove=
d is required.
> +-                      if simple_key.required {
> +-                              return yaml_parser_set_scanner_error(pars=
er,
> +-                                      "while scanning a simple key", si=
mple_key.mark,
> +-                                      "could not find expected ':'")
> +-                      }
> +-                      simple_key.possible =3D false
> ++func yaml_simple_key_is_valid(parser *yaml_parser_t, simple_key *yaml_s=
imple_key_t) (valid, ok bool) {
> ++      if !simple_key.possible {
> ++              return false, true
> ++      }
> ++
> ++      // The 1.2 specification says:
> ++      //
> ++      //     "If the ? indicator is omitted, parsing needs to see past =
the
> ++      //     implicit key to recognize it as such. To limit the amount =
of
> ++      //     lookahead required, the =E2=80=9C:=E2=80=9D indicator must=
 appear at most 1024
> ++      //     Unicode characters beyond the start of the key. In additio=
n, the key
> ++      //     is restricted to a single line."
> ++      //
> ++      if simple_key.mark.line < parser.mark.line || simple_key.mark.ind=
ex+1024 < parser.mark.index {
> ++              // Check if the potential simple key to be removed is req=
uired.
> ++              if simple_key.required {
> ++                      return false, yaml_parser_set_scanner_error(parse=
r,
> ++                              "while scanning a simple key", simple_key=
.mark,
> ++                              "could not find expected ':'")
> +               }
> ++              simple_key.possible =3D false
> ++              return false, true
> +       }
> +-      return true
> ++      return true, true
> + }
> +
> + // Check if a simple key may start at the current position and add it i=
f
> +@@ -879,13 +862,14 @@ func yaml_parser_save_simple_key(parser *yaml_pars=
er_t) bool {
> +                       possible:     true,
> +                       required:     required,
> +                       token_number: parser.tokens_parsed + (len(parser.=
tokens) - parser.tokens_head),
> ++                      mark:         parser.mark,
> +               }
> +-              simple_key.mark =3D parser.mark
> +
> +               if !yaml_parser_remove_simple_key(parser) {
> +                       return false
> +               }
> +               parser.simple_keys[len(parser.simple_keys)-1] =3D simple_=
key
> ++              parser.simple_keys_by_tok[simple_key.token_number] =3D le=
n(parser.simple_keys) - 1
> +       }
> +       return true
> + }
> +@@ -900,9 +884,10 @@ func yaml_parser_remove_simple_key(parser *yaml_par=
ser_t) bool {
> +                               "while scanning a simple key", parser.sim=
ple_keys[i].mark,
> +                               "could not find expected ':'")
> +               }
> ++              // Remove the key from the stack.
> ++              parser.simple_keys[i].possible =3D false
> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[i].t=
oken_number)
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
> +-      parser.simple_keys =3D append(parser.simple_keys, yaml_simple_key=
_t{})
> ++      parser.simple_keys =3D append(parser.simple_keys, yaml_simple_key=
_t{
> ++              possible:     false,
> ++              required:     false,
> ++              token_number: parser.tokens_parsed + (len(parser.tokens) =
- parser.tokens_head),
> ++              mark:         parser.mark,
> ++      })
> +
> +       // Increase the flow level.
> +       parser.flow_level++
> +@@ -928,7 +918,9 @@ func yaml_parser_increase_flow_level(parser *yaml_pa=
rser_t) bool {
> + func yaml_parser_decrease_flow_level(parser *yaml_parser_t) bool {
> +       if parser.flow_level > 0 {
> +               parser.flow_level--
> +-              parser.simple_keys =3D parser.simple_keys[:len(parser.sim=
ple_keys)-1]
> ++              last :=3D len(parser.simple_keys) - 1
> ++              delete(parser.simple_keys_by_tok, parser.simple_keys[last=
].token_number)
> ++              parser.simple_keys =3D parser.simple_keys[:last]
> +       }
> +       return true
> + }
> +@@ -1005,6 +997,8 @@ func yaml_parser_fetch_stream_start(parser *yaml_pa=
rser_t) bool {
> +       // Initialize the simple key stack.
> +       parser.simple_keys =3D append(parser.simple_keys, yaml_simple_key=
_t{})
> +
> ++      parser.simple_keys_by_tok =3D make(map[int]int)
> ++
> +       // A simple key is allowed at the beginning of the stream.
> +       parser.simple_key_allowed =3D true
> +
> +@@ -1286,7 +1280,11 @@ func yaml_parser_fetch_value(parser *yaml_parser_=
t) bool {
> +       simple_key :=3D &parser.simple_keys[len(parser.simple_keys)-1]
> +
> +       // Have we found a simple key?
> +-      if simple_key.possible {
> ++      if valid, ok :=3D yaml_simple_key_is_valid(parser, simple_key); !=
ok {
> ++              return false
> ++
> ++      } else if valid {
> ++
> +               // Create the KEY token and insert it into the queue.
> +               token :=3D yaml_token_t{
> +                       typ:        yaml_KEY_TOKEN,
> +@@ -1304,6 +1302,7 @@ func yaml_parser_fetch_value(parser *yaml_parser_t=
) bool {
> +
> +               // Remove the simple key.
> +               simple_key.possible =3D false
> ++              delete(parser.simple_keys_by_tok, simple_key.token_number=
)
> +
> +               // A simple key cannot follow another simple key.
> +               parser.simple_key_allowed =3D false
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yaml.go b/src/import/ven=
dor/gopkg.in/yaml.v2/yaml.go
> +index de85aa4cdb7..89650e293ac 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/yaml.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yaml.go
> +@@ -89,7 +89,7 @@ func UnmarshalStrict(in []byte, out interface{}) (err =
error) {
> +       return unmarshal(in, out, true)
> + }
> +
> +-// A Decorder reads and decodes YAML values from an input stream.
> ++// A Decoder reads and decodes YAML values from an input stream.
> + type Decoder struct {
> +       strict bool
> +       parser *parser
> +diff --git a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go b/src/import/ve=
ndor/gopkg.in/yaml.v2/yamlh.go
> +index e25cee563be..f6a9c8e34b1 100644
> +--- a/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
> ++++ b/src/import/vendor/gopkg.in/yaml.v2/yamlh.go
> +@@ -579,6 +579,7 @@ type yaml_parser_t struct {
> +
> +       simple_key_allowed bool                // May a simple key occur =
at the current position?
> +       simple_keys        []yaml_simple_key_t // The stack of simple key=
s.
> ++      simple_keys_by_tok map[int]int         // possible simple_key ind=
exes indexed by token_number
> +
> +       // Parser stuff
> +
> +diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.t=
xt
> +index 4585ca5ec0d..06a5d7fa5a0 100644
> +--- a/src/import/vendor/modules.txt
> ++++ b/src/import/vendor/modules.txt
> +@@ -1069,7 +1069,7 @@ gopkg.in/square/go-jose.v2/jwt
> + gopkg.in/tomb.v1
> + # gopkg.in/warnings.v0 v0.1.1 =3D> gopkg.in/warnings.v0 v0.1.1
> + gopkg.in/warnings.v0
> +-# gopkg.in/yaml.v2 v2.2.4 =3D> gopkg.in/yaml.v2 v2.2.4
> ++# gopkg.in/yaml.v2 v2.2.8 =3D> gopkg.in/yaml.v2 v2.2.8
> + gopkg.in/yaml.v2
> + # gotest.tools v2.2.0+incompatible =3D> gotest.tools v2.2.0+incompatibl=
e
> + gotest.tools
> +--
> +2.23.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-co=
ntainers/kubernetes/kubernetes_git.bb
> index e96b7d6..941e0ca 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.git=
;branch=3Drelease-1.16;name=3Dk
>             file://CVE-2020-8551.patch \
>             file://CVE-2020-8552.patch \
>             file://CVE-2020-8555.patch \
> +           file://CVE-2019-11254.patch \
>            "
>
>  DEPENDS +=3D "rsync-native \
> --
> 2.17.1
>
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
