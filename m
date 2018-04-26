Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1404AE00831; Thu, 26 Apr 2018 15:03:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2473E007F2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:03:33 -0700 (PDT)
Received: by mail-lf0-f44.google.com with SMTP id q5-v6so32906282lff.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZJR6s+3+0P7i4LYbMJiRbN63VpDV+XdyfoIPVeGZb/s=;
	b=YN13p7QZ50pqZ321nbZaif7+6FwuvJq9fREwe9AumSEx+aZUgQA0NOlBShjZMQmGe6
	1EUy8p1IKyEZ/XK2djNAhUWLZ0+OwsY2FQ1Ndd3SeYgD+VvKOIHJHMa3NqhUvqFsv65a
	tnA1gxm7QMW1h7IFtnCPQ78eZrrbBtS3iwOZqa0mKmutO3EVHNfsHkQOFx6PbUGh88a5
	1tWU08y4VVOAobodDvC2JWKMFo7QwOFgw31dsMC/g1VtKCuHzd/fNS96w2Wnst9wjZUe
	aZbNgsESGGgPxgCWYcNh7fxnC8HhbGgHXXCjc/S+2dd0OJz0dVG/c7HNz+q9fdXVM1bV
	8iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZJR6s+3+0P7i4LYbMJiRbN63VpDV+XdyfoIPVeGZb/s=;
	b=q6xxsLDadO28UkHLkG8L1jZ9uRHsdtZlTxqg5M/Op3k9MHlorYT1Mr8fp0/RNy/a5S
	+oDWQp76LIisV7o3kRNjHEI+yEiXAbW2OWVCUExn78m8ZAs/FO7ue+sGyp4NSh7XKQXU
	Ck+WHsTFzkRfBJRsSmIzDo8dt9Uk6GQPKagT5TPqihXGbPUOVe/uH/k69wSC7Au7GMG4
	+5zsaqpy/MLYZShK8icNtaVZ0Hkf1dsya7HEujhu4Dd77+E6KxhfbhfncCueA6uxSFz+
	fUtItFP903pjPnblpdj0DGdwYzkTh7fNNuPNFBkfVFEoNwQ83257RtoxoWhHru9cufVY
	SkGg==
X-Gm-Message-State: ALQs6tAb8vmQFGSsdkCH+YMKWdKgzCDfGAFWHX3AMXVnEVeYlU7MvH+k
	ulMXhFfkIuk2gJQwIE3IKaRlJXASKgiw9r9HXSUbhqXa
X-Google-Smtp-Source: AB8JxZr27r8WjFTqR2YheAAP2N4P9NTXRyGe7XeiDikaLrIdmAW1W1sKlFJeqhNV9MnoIcPBsNrqPbk5duAsW4UBb40=
X-Received: by 2002:a19:5a1d:: with SMTP id
	o29-v6mr17517800lfb.93.1524780212491; 
	Thu, 26 Apr 2018 15:03:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.145.78 with HTTP; Thu, 26 Apr 2018 15:03:31 -0700 (PDT)
In-Reply-To: <447292399de0d4dc87b4c584c831f9f76a3b48b4.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
	<447292399de0d4dc87b4c584c831f9f76a3b48b4.1524769930.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 26 Apr 2018 15:03:31 -0700
Message-ID: <CACMJ4GaQDVTsMLx_g9G4ay2-y-5=7tWz0KUQWCCg_1rqderCUQ@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v3 3/8] xen: Mini-OS source code with make links target applied
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
X-List-Received-Date: Thu, 26 Apr 2018 22:03:35 -0000
Content-Type: multipart/alternative; boundary="000000000000ed1844056ac78e30"

--000000000000ed1844056ac78e30
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <
kurt.bodiker@braintrust-us.com> wrote:

> Mini-OS is a tiny OS kernel distributed with the Xen Project Hypervisor
> sources. It is mainly used as operating system for stub domains that are
> used for Dom0 Disaggregation.
>
> The Mini-OS source tree is updated and released in coordination with Xen
> releases. The Mini-OS source tree and architecture-specific symbolic
> links are required for building the dependencies used to build Xen
> stubodmains. For convenience, the make links target was executed before
> packaging. Otherwise, this is a source package. The current build
> methods for Xen stubdomains require either a source archive which
> contains the Mini-OS source code or execution of a make target that will
> fetch the appropriate Mini-OS source tree from it's git repository. This
> recipe removes the mysticism of relating to the version of Mini-OS being
> used and it's origins and provides the flexibility to easily changes
> versions or patch as necessary.
>
> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> ---
> Changes in v3:
>  - none
> Changes in v2:
>  - Mini-OS recipe introduced
> ---
>  .../xen/files/mini-os_udivmoddi4-gcc7.patch        | 43
> ++++++++++++++++++++++
>  recipes-extended/xen/mini-os.inc                   | 28 ++++++++++++++
>  recipes-extended/xen/mini-os_4.9.0.bb              | 18 +++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 recipes-extended/xen/files/
> mini-os_udivmoddi4-gcc7.patch
>  create mode 100644 recipes-extended/xen/mini-os.inc
>  create mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
>
> diff --git a/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
> b/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
> new file mode 100644
> index 0000000..a9eef60
> --- /dev/null
> +++ b/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
> @@ -0,0 +1,43 @@
> +From d991bdbc062248221511ecb795617c36b37e1d2e Mon Sep 17 00:00:00 2001
> +From: Wei Liu <wei.liu2@citrix.com>
> +Date: Wed, 9 Aug 2017 13:15:48 +0100
> +Subject: [PATCH] lib/math.c: implement __udivmoddi4
> +
> +Some code compiled by gcc 7 requires this.
> +
> +Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> +Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> +---
> + lib/math.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/lib/math.c b/lib/math.c
> +index 561393e..b98cc1d 100644
> +--- a/lib/math.c
> ++++ b/lib/math.c
> +@@ -6,6 +6,7 @@
> +  *        File: math.c
> +  *      Author: Rolf Neugebauer (neugebar@dcs.gla.ac.uk)
> +  *     Changes:
> ++ *        Implement __udivmoddi4 (Wei Liu <wei.liu2@citrix.com>)
> +  *
> +  *        Date: Aug 2003
> +  *
>


Hitting whitespace damage on applying this patch with the hunk above.

Christopher

--000000000000ed1844056ac78e30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <span dir=3D"ltr">&lt;<a =
href=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodik=
er@braintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Mini-OS is a tiny OS kernel distributed with the Xen Project Hypervisor<b=
r>
sources. It is mainly used as operating system for stub domains that are<br=
>
used for Dom0 Disaggregation.<br>
<br>
The Mini-OS source tree is updated and released in coordination with Xen<br=
>
releases. The Mini-OS source tree and architecture-specific symbolic<br>
links are required for building the dependencies used to build Xen<br>
stubodmains. For convenience, the make links target was executed before<br>
packaging. Otherwise, this is a source package. The current build<br>
methods for Xen stubdomains require either a source archive which<br>
contains the Mini-OS source code or execution of a make target that will<br=
>
fetch the appropriate Mini-OS source tree from it&#39;s git repository. Thi=
s<br>
recipe removes the mysticism of relating to the version of Mini-OS being<br=
>
used and it&#39;s origins and provides the flexibility to easily changes<br=
>
versions or patch as necessary.<br>
<br>
Signed-off-by: Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-u=
s.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
---<br>
Changes in v3:<br>
=C2=A0- none<br>
Changes in v2:<br>
=C2=A0- Mini-OS recipe introduced<br>
---<br>
=C2=A0.../xen/files/mini-os_<wbr>udivmoddi4-gcc7.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 43 ++++++++++++++++++++++<br>
=C2=A0recipes-extended/xen/mini-os.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ++++++++++++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://mini-os_4.9.0.bb" rel=3D"noref=
errer" target=3D"_blank">mini-os_<wbr>4.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++<br>
=C2=A03 files changed, 89 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>mini-os_udivmoddi4=
-gcc7.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/mini-os.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://mini-os_4.9=
.0.bb" rel=3D"noreferrer" target=3D"_blank">mini-os_<wbr>4.9.0.bb</a><br>
<br>
diff --git a/recipes-extended/xen/files/<wbr>mini-os_udivmoddi4-gcc7.patch =
b/recipes-extended/xen/files/<wbr>mini-os_udivmoddi4-gcc7.patch<br>
new file mode 100644<br>
index 0000000..a9eef60<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/files/<wbr>mini-os_udivmoddi4-gcc7.patch<br>
@@ -0,0 +1,43 @@<br>
+From d991bdbc062248221511ecb795617c<wbr>36b37e1d2e Mon Sep 17 00:00:00 200=
1<br>
+From: Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2@citrix.c=
om</a>&gt;<br>
+Date: Wed, 9 Aug 2017 13:15:48 +0100<br>
+Subject: [PATCH] lib/math.c: implement __udivmoddi4<br>
+<br>
+Some code compiled by gcc 7 requires this.<br>
+<br>
+Signed-off-by: Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2=
@citrix.com</a>&gt;<br>
+Reviewed-by: Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@ens-lyo=
n.org">samuel.thibault@ens-lyon.org</a>&gt;<br>
+---<br>
+ lib/math.c | 10 ++++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff --git a/lib/math.c b/lib/math.c<br>
+index 561393e..b98cc1d 100644<br>
+--- a/lib/math.c<br>
++++ b/lib/math.c<br>
+@@ -6,6 +6,7 @@<br>
+=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 File: math.c<br>
+=C2=A0 *=C2=A0 =C2=A0 =C2=A0 Author: Rolf Neugebauer (<a href=3D"mailto:ne=
ugebar@dcs.gla.ac.uk">neugebar@dcs.gla.ac.uk</a>)<br>
+=C2=A0 *=C2=A0 =C2=A0 =C2=A0Changes:<br>
++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 Implement __udivmoddi4 (Wei Liu &lt;<a href=
=3D"mailto:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt;)<br>
+=C2=A0 *<br>
+=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 Date: Aug 2003<br>
+=C2=A0 *<br>
</blockquote><div><br></div><div><br class=3D"gmail-Apple-interchange-newli=
ne"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">Hitting whitespace damage on applying this pa=
tch with the hunk above.</span><br></div><div><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline"><br=
></span></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">Christopher</span></div><div><=
br></div></div></div></div>

--000000000000ed1844056ac78e30--
