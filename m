Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 180B0E02317; Mon, 11 Jun 2018 09:09:12 -0700 (PDT)
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
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF8D1E02312
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:09:10 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id t134-v6so31400215lff.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zat6rFKZfS9TCGqd5/FWyukgECm8Wqb2vp6v75AEo+U=;
	b=FlVE8o1gdV0j695kXzk+Fy0QwblMPWWbe+p1OPvv/pzmrEtJZA5iPiwZywTQOa1An/
	/olKrLUDc7lHXwSSl3Chsl1YBn5mil98LgQKMbpHjlaa/eYqUllVxUv+YyMadv1InDIb
	FRmt59ukPO0KVF8cES5FuBTZweERpMHDIEyBosz6gV0IpE/JXEO/Bkv2D8joohHykpkG
	12XuNaikBFm6WfkJbZnb/KJhfQPiTuZ8MBaVQKhDd/saj1um/RBRPaxitRN+aVDVUgKt
	VDnjq1Gik1ApRdvLn14nkD6W33pRcjyzXp3U2Ica/GKfEIQT4YDcivWJveQ5N6+6piXn
	WmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zat6rFKZfS9TCGqd5/FWyukgECm8Wqb2vp6v75AEo+U=;
	b=UNLupPCApEFu5YyGJzK5uOBJFU12MkCtz+KlogsS3jjmP3DmfIhGBLKGeWlGiNxZbe
	pfPVgMuo+BomKZ2Z2M2OJT7RHLhgmsk6nBbN57hnn8TfPZgYcmiFQuoQdG+1dNf26wbo
	DaU06LGUt7HyQQRY/I6mpHwpUqwGRQXZYZDSsmxbY1O2EDDU0JF5yS02IkTrCD9Ttr31
	vZsMEWmFGvzI/DgvBYkVBk41ttFL6b8ew6JyRrKoLz3opFZFL8qBfXi/MGcKf17ai58v
	GeSOSPp83yIQRjTM6ct78WJFkNZ/96+wUoEZ1eEXDs882fDATcIwsluyeCQC2l5JGwlg
	BTRA==
X-Gm-Message-State: APt69E2IB6pJfuD/b95oifWZ3fCiaUS9foQW0yC8gUBt/swJQMyLPnC9
	0pGD4jiO/+rFZCvjIdb+qjQRLQ8hEPc+Zdv35Rs=
X-Google-Smtp-Source: ADUXVKJietC87pxYSs3awc0neMQ0OhAzFaxP98ND4Gi8m+gBxPDKSKKyZVkgiBPYI0N5VaWQj6iChoHfE9P+KQKb6dQ=
X-Received: by 2002:a2e:5358:: with SMTP id
	t24-v6mr12567884ljd.129.1528733349799; 
	Mon, 11 Jun 2018 09:09:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:09:09
	-0700 (PDT)
In-Reply-To: <1527816362-29658-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1527816362-29658-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jun 2018 12:09:09 -0400
Message-ID: <CADkTA4OoWr9NbhnMHFG_=n0NbLRxzpaQ6q7XBVHjKw3LzqLPnQ@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH] python-saharaclient: Fix build error as following:
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
X-List-Received-Date: Mon, 11 Jun 2018 16:09:12 -0000
Content-Type: multipart/alternative; boundary="000000000000456e3c056e5ff891"

--000000000000456e3c056e5ff891
Content-Type: text/plain; charset="UTF-8"

This had a reject when applying the patch, but I resolved it and pushed the
change.

If there's an issue with my resolution, send follow up patches.

Cheers,

Bruce

On Thu, May 31, 2018 at 9:26 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> "distutils.errors.DistutilsError: Could not find suitable distribution
> for Requirement.parse('pbr>=2.0.0')"
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-saharaclient_git.bb | 5
> +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> saharaclient_git.bb
> index 0ec262c..1ce3a85 100644
> --- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> @@ -14,6 +14,11 @@ DEPENDS += " \
>          python-pbr-native \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +"
> +
>  RDEPENDS_${PN} += " \
>         python-pbr \
>         "
> --
> 1.9.1
>
>
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

--000000000000456e3c056e5ff891
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This had a reject when applying the patch, but I resolved =
it and pushed the change.<div><br></div><div>If there&#39;s an issue with m=
y resolution, send follow up patches.</div><div><br></div><div>Cheers,</div=
><div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Thu, May 31, 2018 at 9:26 PM, Lei Maohui <span dir=
=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com" target=3D"_blank">=
leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">&quot;distutils.errors.<wbr>DistutilsError: Could not find suitable d=
istribution for Requirement.parse(&#39;pbr&gt;=3D2.0.0&#39;<wbr>)&quot;<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">l=
eimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
saharaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>sahar=
aclient_git.bb</a> | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-saharaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wb=
r>saharaclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a =
href=3D"http://python-saharaclient_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python-<wbr>saharaclient_git.bb</a><br>
index 0ec262c..1ce3a85 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
saharaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>sahar=
aclient_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
saharaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>sahar=
aclient_git.bb</a><br>
@@ -14,6 +14,11 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+&quot;<br>
+<br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
1.9.1<br>
<br>
<br>
<br>
-- <br>
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
</div>

--000000000000456e3c056e5ff891--
