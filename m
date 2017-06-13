Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D88DCE00B87; Tue, 13 Jun 2017 15:22:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92C36E00888
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Jun 2017 15:22:36 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id u8so1319669qka.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Jun 2017 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MCLx9yg1yvAZ+OiYh82AWn/0BCVuUBo92CypErIOqFg=;
	b=WNypP3SOA2jNAiNjkSoOVEBlSiaIxonGoO3dZ/tSZibCPHnaK+Nw1gGG8F0h94Hdhw
	eR27DRIzuP3yqFyYjPKKKmX44SylczSztMVQT3dCmSwN90jgcq1qIJKN5nppG6UTxiHf
	YZKmWIT6EOQMZrtp9J1GloAezjLSgd+qU0SMNkbuoyr+771hWhoWlz+mMtAiR8NuiLr3
	NIQxgtFoW20HASIncGAIqdHyg0omS7ncAbV0OqPxn3sPQyVHAFwBwdzR/I+3rqsri9Bk
	9lGKfiyy48kbZc1OsAg8WrGPpyaqY1SXSNqSJYoKW83+efaoW9HZc/6tNt3ZMesZ0Wsr
	jxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MCLx9yg1yvAZ+OiYh82AWn/0BCVuUBo92CypErIOqFg=;
	b=M9i2bl6BdoDKDo4USgzAFtie6H5LK1sdzxHxteTge/dUI8utRNDDBk1FnLdngU2u/S
	PmhccHtZJwqDbVQscDGi55rkzEAD2lN2JpgJCBHsKVc/HgYjGylPvx3ufjdwPuf4kpD8
	IVphtOczi0d/xAlZ9wOilwfjrSIRA3s1NmI9DlisfyvbWz1mwzx3i94OFyO3pl6bb+We
	jB3ifoJFnOKA3ppey/QcIctTYa2fTl1H/Y5aVwTTA7VCZxWOu/BDifdxE0GpRSGcC296
	xj7ZfD18lYM793ZSDCbQqNB9A4yNQtsGMuKV3Kgd+rswLRzUvc3j9Ot9YncoPMiL7zpk
	a+iw==
X-Gm-Message-State: AKS2vOx/gk3JoqE3CljKgcpOKIv6SLcWNbcCSGyueZ2SaRxBe9yriyHA
	pcufBOLGVGgnjFFow+3O2F++GFfm5w==
X-Received: by 10.55.212.199 with SMTP id s68mr3052849qks.88.1497392555707;
	Tue, 13 Jun 2017 15:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.209.28 with HTTP; Tue, 13 Jun 2017 15:22:35 -0700 (PDT)
In-Reply-To: <1496987447-8064-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496987447-8064-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jun 2017 00:22:35 +0200
Message-ID: <CADkTA4PQ7aPDA=Wb_LpjU+oMEwc_2+BWLzYYV48xdqth+rqKRw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: Fix CVE-2017-9263
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jun 2017 22:22:45 -0000
Content-Type: multipart/alternative; boundary="001a11479ea65f51ba0551dedf16"

--001a11479ea65f51ba0551dedf16
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Jun 9, 2017 at 7:50 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> Backport patch file to fix CVE-2017-9263
>
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../openvswitch-git/CVE-2017-9263.patch            | 29
> ++++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/
> CVE-2017-9263.patch
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
> b/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
> new file mode 100644
> index 0000000..0fc3aa1
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
> @@ -0,0 +1,29 @@
> +A buggy or malicious switch could send a role status message with a bad
> +reason code, which if printed by OVS would cause it to abort.  This fixes
> +the problem.
> +
> +CVE: CVE-2017-9263
> +Upstream-Status: Submitted
> +
> +Reported-by: Bhargava Shastry <bshastry at sec.t-labs.tu-berlin.de>
> +Signed-off-by: Ben Pfaff <blp at ovn.org>
> +---
> + lib/ofp-print.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/ofp-print.c b/lib/ofp-print.c
> +index 7ca953100539..1932baf4871f 100644
> +--- a/lib/ofp-print.c
> ++++ b/lib/ofp-print.c
> +@@ -2147,7 +2147,8 @@ ofp_print_role_status_message(struct ds *string,
> const struct ofp_header *oh)
> +         break;
> +     case OFPCRR_N_REASONS:
> +     default:
> +-        OVS_NOT_REACHED();
> ++        ds_put_cstr(string, "(unknown)");
> ++        break;
> +     }
> + }
> +
> +--
> +2.10.2
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 1fb82ae..6ab0c40 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -29,6 +29,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://python-make-remaining-scripts-use-usr-bin-env.patch \
>             file://0001-use-the-linux-if_packet.h-Interface-directly.patch
> \
>             file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
> +           file://CVE-2017-9263.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11479ea65f51ba0551dedf16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Fri, Jun 9, 2017 at 7:50 AM, Fan Xin=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" target=3D"=
_blank">fan.xin@jp.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Backport patch file to fix CVE-2017-9263<br>
<br>
Signed-off-by: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com">fan.xi=
n@jp.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../openvswitch-git/CVE-2017-<wbr>9263.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 29 ++++++++++++++++++++++<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=
=A0 1 +<br>
=C2=A02 files changed, 30 insertions(+)<br>
=C2=A0create mode 100644 recipes-networking/<wbr>openvswitch/openvswitch-gi=
t/<wbr>CVE-2017-9263.patch<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>CVE-2=
017-9263.patch b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>C=
VE-2017-9263.patch<br>
new file mode 100644<br>
index 0000000..0fc3aa1<br>
--- /dev/null<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>CVE-2017-926=
3.patch<br>
@@ -0,0 +1,29 @@<br>
+A buggy or malicious switch could send a role status message with a bad<br=
>
+reason code, which if printed by OVS would cause it to abort.=C2=A0 This f=
ixes<br>
+the problem.<br>
+<br>
+CVE: CVE-2017-9263<br>
+Upstream-Status: Submitted<br>
+<br>
+Reported-by: Bhargava Shastry &lt;bshastry at <a href=3D"http://sec.t-labs=
.tu-berlin.de" rel=3D"noreferrer" target=3D"_blank">sec.t-labs.tu-berlin.de=
</a>&gt;<br>
+Signed-off-by: Ben Pfaff &lt;blp at <a href=3D"http://ovn.org" rel=3D"nore=
ferrer" target=3D"_blank">ovn.org</a>&gt;<br>
+---<br>
+ lib/ofp-print.c | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/ofp-print.c b/lib/ofp-print.c<br>
+index 7ca953100539..1932baf4871f 100644<br>
+--- a/lib/ofp-print.c<br>
++++ b/lib/ofp-print.c<br>
+@@ -2147,7 +2147,8 @@ ofp_print_role_status_message(<wbr>struct ds *string=
, const struct ofp_header *oh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case OFPCRR_N_REASONS:<br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 OVS_NOT_REACHED();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ds_put_cstr(string, &quot;(unknown)&quot;);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+--<br>
+2.10.2<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index 1fb82ae..6ab0c40 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;file://openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-make-remaining-<wbr=
>scripts-use-usr-bin-env.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-use-the-linux-if_<wbr=
>packet.h-Interface-directly.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Define-WAIT_ANY-<wbr>=
if-not-provided-by-system.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-9263.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div></div>

--001a11479ea65f51ba0551dedf16--
