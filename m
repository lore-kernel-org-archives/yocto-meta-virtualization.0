Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8868BE68950
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 03:56:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5039.1730346987683623664
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 20:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+Dm1E+B;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so359873b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Oct 2024 20:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730346987; x=1730951787; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/sFJomWnNNolLkUgGtpUv52tNy2uJ0Uho0HGqzDw63A=;
        b=l+Dm1E+BV4mtPjNfAV2bfdEnhYKly5KSpxH+2f0ispr/ayYcG4VtVfutSbgOBWOur3
         nmZ1dckwM9PxgYpoBJzmoeEbvrKOBlw6f6ogFSN10hksvgXzyJjl4OiP6Gx2YeSlrSd5
         9Ygg0lEm/5ywYHKVElGE1S23cqELhqQvMwmdjaglAfY1+25NrpQVIiwXrcXKRr3h8xUp
         6JaUaiCfyQJtsLDo1Kcj1giGNfiEV/LyH85Y8hQbLzEa+NDeHxyFqGByQgciC2Ga4Dgs
         mWmIBBcfI/X/iUHfkwACVoL/g2ZH0k/E9u/HW1pBzKuHZGSS7COtiu4KpRlu0JhZMeyt
         T61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730346987; x=1730951787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sFJomWnNNolLkUgGtpUv52tNy2uJ0Uho0HGqzDw63A=;
        b=RW/I33anwknXSLcOizO/nIYy04NwAoff/YMFQ/RNRz+f6jL+8ehju4cLAbrFsNdT1u
         /2aoL1Z8RSyP5dtOUwS/wAdI556aDjtDNG9K0JebRVeYVg9xW0RvCAomcX2AYydpzUsR
         6G5RhHhXy2lN/IshKaz/Qsp/qGWrfK9kj2xChnVTsqBK77YlFtMG7IrellkYbzGaZbNn
         XXgcUYpPRVM3o5AVICLmK+ZvBMr82F36sdPVGOq9IJwELXdko+wb9Ltc5FooTcxwDHWO
         UwqIb/eQV0uWaMuu9fdU+W1bvrUPG25HegOQWnAXw030K1CuUak6Icfmj16FVKb95xe7
         a0Xg==
X-Gm-Message-State: AOJu0Yxn+JgGnDcIZcwdnc0vDbLs5LVIs4g6cUiKRhq/E5EZmVkoaUw8
	FHyhRV+PDLKtSoJGJgpPSOA5ay5g50kejr6eOFPH0KVpS8NKx3icxYzbMKaYe3ixMGgRq/x7Dsr
	d+SIlYo5Zu/RytX2fAwQgu8B/ypA=
X-Google-Smtp-Source: AGHT+IFt9AMp+AoiRDszzcCMy7P9P8qhJhJYR1ozwbTunarGdQ7+LmU+pVsJzx5z8qhGAdRE6dw2L2z2iPJLtWyKvqg=
X-Received: by 2002:a05:6a00:992:b0:71e:7ab6:8ea6 with SMTP id
 d2e1a72fcca58-72063093c2amr24535540b3a.25.1730346986754; Wed, 30 Oct 2024
 20:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241021112343.2793593-1-bin.lan.cn@windriver.com>
In-Reply-To: <20241021112343.2793593-1-bin.lan.cn@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 Oct 2024 23:56:15 -0400
Message-ID: <CADkTA4Pvhq8-patZ9zY7qDk5zav4QM6XXH6G=so_UjC5oU67nQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [master][PATCH] openvswitch: fix ptest
 contains reference to TMPDIR [buildpaths]
To: bin.lan.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007bd9180625bdcd8a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 03:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8945

--0000000000007bd9180625bdcd8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.

I injured my hand (so I couldn't type) and then had to do some release
preparation, but will get to merging his shortly.

Bruce

On Mon, Oct 21, 2024 at 7:23=E2=80=AFAM Bin Lan via lists.yoctoproject.org =
<
bin.lan.cn=3Dwindriver.com@lists.yoctoproject.org> wrote:

> The EGREP in ptest/tests/atlocal contains the build paths.
> The CFLAGS in ptest/tests/atlocal contains the build paths.
> This change set fixs:
>  - set EGREP to "grep -E" in ptest/tests/atlocal
>  - set CFLAGS to " " in ptest/tests/atlocal
> by updating the patch
> openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  ...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git
> a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71=
d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71=
d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> index 571753a5..abad1458 100644
> ---
> a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71=
d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> +++
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71=
d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> @@ -16,6 +16,13 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>  refresh patch to fix patch-fuzz warning
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>
> +Refresh patch to fix file ptest/tests/atlocal
> +contains reference to TMPDIR [buildpaths]. The fix is:
> + - set EGREP to "grep -E" in ptest/tests/atlocal
> + - set CFLAGS to " " in ptest/tests/atlocal
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +
>  Upstream-Status: Inappropriate [embedded specific]
>  ---
>   Makefile.am |  1 +
> @@ -37,7 +44,7 @@ new file mode 100644
>  index 0000000..0b4587c
>  --- /dev/null
>  +++ b/test.mk
> -@@ -0,0 +1,74 @@
> +@@ -0,0 +1,76 @@
>  +TEST_DEST ?=3D ${prefix}/lib/openvswitch
>  +TEST_ROOT ?=3D ${prefix}/lib/openvswitch
>  +TEST_DEPEND =3D
> @@ -112,3 +119,5 @@ index 0000000..0b4587c
>  +      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
>  +      sed -i
> 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.=
bash|g'
> $(TEST_DEST)/tests/testsuite
>  +      sed -i
> 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.ba=
sh|g'
> $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|EGREP=3D.*|EGREP=3D'"'"'grep -E'"'"'|g'
> $(TEST_DEST)/tests/atlocal
> ++      sed -i 's|CFLAGS=3D.*|CFLAGS=3D'"'"' '"'"'|g'
> $(TEST_DEST)/tests/atlocal
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8933):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8933
> Mute This Topic: https://lists.yoctoproject.org/mt/109130169/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007bd9180625bdcd8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v id=3D"gmail-:23e" class=3D"gmail-Am gmail-aiL gmail-aO9 gmail-Al editable=
 gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Message Body" role=3D"=
textbox" aria-multiline=3D"true" tabindex=3D"1" style=3D"direction:ltr;min-=
height:85px" aria-controls=3D":260" aria-expanded=3D"false"><div class=3D"g=
mail_default">Thanks for the patch.</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">I injured my hand (so I couldn&#39;t type=
) and then had to do some release preparation, but will get to merging=C2=
=A0his shortly.</div><div class=3D"gmail_default"><br></div><div class=3D"g=
mail_default">Bruce</div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 21, 2024 at 7:23=E2=80=AFA=
M Bin Lan via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.=
org</a> &lt;<a href=3D"http://bin.lan.cn">bin.lan.cn</a>=3D<a href=3D"mailt=
o:windriver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The EGREP in ptest/tests/atlocal contains the build paths.<br>
The CFLAGS in ptest/tests/atlocal contains the build paths.<br>
This change set fixs:<br>
=C2=A0- set EGREP to &quot;grep -E&quot; in ptest/tests/atlocal<br>
=C2=A0- set CFLAGS to &quot; &quot; in ptest/tests/atlocal<br>
by updating the patch<br>
openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.<br>
<br>
Signed-off-by: Bin Lan &lt;<a href=3D"mailto:bin.lan.cn@windriver.com" targ=
et=3D"_blank">bin.lan.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++=
-<br>
=C2=A01 file changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add=
-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/=
openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9f=
baf5a2ae34de2f3.patch<br>
index 571753a5..abad1458 100644<br>
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-=
71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch<br>
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-=
71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch<br>
@@ -16,6 +16,13 @@ Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windr=
iver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
=C2=A0refresh patch to fix patch-fuzz warning<br>
=C2=A0Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
+Refresh patch to fix file ptest/tests/atlocal <br>
+contains reference to TMPDIR [buildpaths]. The fix is:<br>
+ - set EGREP to &quot;grep -E&quot; in ptest/tests/atlocal<br>
+ - set CFLAGS to &quot; &quot; in ptest/tests/atlocal<br>
+<br>
+Signed-off-by: Bin Lan &lt;<a href=3D"mailto:bin.lan.cn@windriver.com" tar=
get=3D"_blank">bin.lan.cn@windriver.com</a>&gt;<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [embedded specific]<br>
=C2=A0---<br>
=C2=A0 Makefile.am |=C2=A0 1 +<br>
@@ -37,7 +44,7 @@ new file mode 100644<br>
=C2=A0index 0000000..0b4587c<br>
=C2=A0--- /dev/null<br>
=C2=A0+++ b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank"=
>test.mk</a><br>
-@@ -0,0 +1,74 @@<br>
+@@ -0,0 +1,76 @@<br>
=C2=A0+TEST_DEST ?=3D ${prefix}/lib/openvswitch<br>
=C2=A0+TEST_ROOT ?=3D ${prefix}/lib/openvswitch<br>
=C2=A0+TEST_DEPEND =3D<br>
@@ -112,3 +119,5 @@ index 0000000..0b4587c<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|$$srcdir|$$abs_srcdir|g&#39; $(TE=
ST_DEST)/tests/testsuite<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-appctl-bashcomp\.bash|/etc/ba=
sh_completion.d/ovs-appctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests/testsui=
te<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-vsctl-bashcomp\.bash|/etc/bas=
h_completion.d/ovs-vsctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests/testsuite=
<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|EGREP=3D.*|EGREP=3D&#39;&quot;&#39;&qu=
ot;&#39;grep -E&#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_DEST)/tests/atloca=
l<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|CFLAGS=3D.*|CFLAGS=3D&#39;&quot;&#39;&=
quot;&#39; &#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_DEST)/tests/atlocal<br=
>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8933): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8933" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8933</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109130169/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109130169/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000007bd9180625bdcd8a--

