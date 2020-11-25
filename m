Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.6902.1606312562488459081
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 05:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=plizfYbc;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k1so2589467eds.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2020 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnRh2BThzjYHqV8xtcathQPb3Du4D7JLiJNmv2Bgi3w=;
        b=plizfYbc4KuJ7Cf8NXvRejmkcO+aOC8xQmtAvDz+leDjos8T/cRuw1+iLPiji/Kt7O
         hbuMQHs9HKXKt1nGkfBEE2Aa0bYOfT58L8BOec0GoMu8aE6ePQr+B9nBh7vwy/adZ9hR
         Y0BORE0Iqx6WO1wMZNzX/rij01m/ZZ1SExT67D71BgUYFFaGUoCgIMImvsemLWRIZfOu
         bme8Iv/lIErx/7JrP8+PQNKf37b69Gj7cJNy97C+qc08VoF2W+6il9foVgjgw5Cr9xLq
         Ri5nOl0bf1606Schn8QnzMu5jTn39uOmksQ/RaDbpXaW/A6dymRlrXO2YJGI/jMmjvSh
         UgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnRh2BThzjYHqV8xtcathQPb3Du4D7JLiJNmv2Bgi3w=;
        b=PsDsaUnVIgACYmZO1u3q4BBAZvC8ogPtem3GhCYGSbBq38+e12d4vGPirnz0yf67G/
         /OZvtP26384D5osLicO9YlvLRsFXpnxEuYXUdWXTFz6WFu9zEXGDyxvkcFv5oVfOo5I4
         yTFR8ShbgmdWTFl4rK1l/qMNuxaXKiWjiaYQYo/B9B/GEvcifwpFVTjpPjG2nOh0yaee
         OZMaJtX3XWy10s2IwvjfymWyveUsVOWX5S6pEkpHzCWIkt6+LnI3aNDbzt+IPhwxQF4W
         2D6qvNGsPB8pqP7BaMIRgHoVW6tXGpgm8LSKdfeY7XY0FBOm+mIe7FYW6C+Cptqo52jS
         SWOQ==
X-Gm-Message-State: AOAM531ugWZkw/IZqqxZPKsRvRenULQ07oKAJIoTv9cXNv9B9bmz0GAf
	NMhZWnvrCXCtcaLfDT/L0IZLb+HZpr+9YHyQQZg=
X-Google-Smtp-Source: ABdhPJxozTmamkaNM3g+Ps/5pB36iuPbe5V1cFdb6ya0cJ7BvDzkidlhGglsRttBcDvybWL2PjzHacjHNn6TU5rs6nY=
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr3547423edy.347.1606312560994;
 Wed, 25 Nov 2020 05:56:00 -0800 (PST)
MIME-Version: 1.0
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
In-Reply-To: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Nov 2020 08:55:49 -0500
Message-ID: <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: Dingo <dingo@optimcloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000098ba5f05b4eec915"

--00000000000098ba5f05b4eec915
Content-Type: text/plain; charset="UTF-8"

Builds fine here, so you'll need to be more specific about your
configuration to see if I can reproduce the issue.

Bruce

On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wrote:

> NOTE: Executing Tasks
> ERROR:
> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
> do_compile: Execution of
> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769'
>
> failed with exit code 2:
> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> +++ [1125 10:38:01] Building go targets for linux/amd64:
>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> !!! [1125 10:38:02] Call tree:
> !!! [1125 10:38:02]  1:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
>
> kube::golang::build_some_binaries(...)
> !!! [1125 10:38:02]  2:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
>
> kube::golang::build_binaries_for_platform(...)
> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
> kube::golang::build_binaries(...)
> !!! [1125 10:38:02] Call tree:
> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> kube::golang::build_binaries(...)
> !!! [1125 10:38:02] Call tree:
> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> kube::golang::build_binaries(...)
> make[1]: *** [Makefile.generated_files:197:
> _output/bin/prerelease-lifecycle-gen] Error 1
> make: *** [Makefile:545: generated_files] Error 2
> WARNING:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179
>
> exit 2 from 'make generated_files GO="go"
> KUBE_BUILD_PLATFORMS="linux/amd64"'
> WARNING: Backtrace (BB generated script):
>      #1: do_compile,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>
> line 179
>      #2: main,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>
> line 198
>
> Backtrace (metadata-relative locations):
>      #1: do_compile,
> /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/
> kubernetes_git.bb,
> line 55
> ERROR: Logfile of failure stored in:
>
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000098ba5f05b4eec915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Builds fine here, so you&#39;ll need to be more specific abou=
t your configuration to see if I can reproduce the issue.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 5:43=
 AM Dingo &lt;<a href=3D"mailto:dingo@optimcloud.com">dingo@optimcloud.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">N=
OTE: Executing Tasks<br>
ERROR: <br>
kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 <br=
>
do_compile: Execution of <br>
&#39;/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_co=
mpile.3481769&#39; <br>
failed with exit code 2:<br>
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
+++ [1125 10:38:01] Building go targets for linux/amd64:<br>
=C2=A0=C2=A0=C2=A0=C2=A0 ./vendor/<a href=3D"http://k8s.io/code-generator/=
cmd/prerelease-lifecycle-gen" rel=3D"noreferrer" target=3D"_blank">k8s.io/c=
ode-generator/cmd/prerelease-lifecycle-gen</a><br>
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
!!! [1125 10:38:02] Call tree:<br>
!!! [1125 10:38:02]=C2=A0 1: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-=
rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang=
.sh:715 <br>
kube::golang::build_some_binaries(...)<br>
!!! [1125 10:38:02]=C2=A0 2: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-=
rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang=
.sh:859 <br>
kube::golang::build_binaries_for_platform(...)<br>
!!! [1125 10:38:02]=C2=A0 3: hack/make-rules/build.sh:27 <br>
kube::golang::build_binaries(...)<br>
!!! [1125 10:38:02] Call tree:<br>
!!! [1125 10:38:02]=C2=A0 1: hack/make-rules/build.sh:27 <br>
kube::golang::build_binaries(...)<br>
!!! [1125 10:38:02] Call tree:<br>
!!! [1125 10:38:02]=C2=A0 1: hack/make-rules/build.sh:27 <br>
kube::golang::build_binaries(...)<br>
make[1]: *** [Makefile.generated_files:197: <br>
_output/bin/prerelease-lifecycle-gen] Error 1<br>
make: *** [Makefile:545: generated_files] Error 2<br>
WARNING: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile=
.3481769:179 <br>
exit 2 from &#39;make generated_files GO=3D&quot;go&quot; <br>
KUBE_BUILD_PLATFORMS=3D&quot;linux/amd64&quot;&#39;<br>
WARNING: Backtrace (BB generated script):<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #1: do_compile, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile=
.3481769, <br>
line 179<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #2: main, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile=
.3481769, <br>
line 198<br>
<br>
Backtrace (metadata-relative locations):<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #1: do_compile, <br>
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/<a=
 href=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kub=
ernetes_git.bb</a>, <br>
line 55<br>
ERROR: Logfile of failure stored in: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.1=
9.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile=
.3481769<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--00000000000098ba5f05b4eec915--
