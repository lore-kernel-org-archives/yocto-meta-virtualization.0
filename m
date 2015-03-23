Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6A9BE0094C; Sun, 22 Mar 2015 19:48:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05545E00853
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:48:06 -0700 (PDT)
Received: by oiag65 with SMTP id g65so130403943oia.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sFJFBmzwUp2s1D8pb6qKqJwTl+5IWUezWlaO8PbfAbw=;
	b=ZxqIIiKBAM3VWzhz0Mc/CedR/6QEo4eGN+7O1KdqbccyunNxAJzAYFefolh39gu1Ne
	qt1Tu/cZyEbhZ6cLoau6XsZwYh9PnNz1hJOcZr5vPx83jFeoEY4MSsl7avREA/hFRgtW
	k4xC1SSDeg/ERVDBjG9fT6qTcwYAW6XpO63PYG27jYba7XkMxeKT6UWSg22MqtXaluBI
	kOpDr2yP3S2tgDaGLVuIFDgnhJ0Nmqk/MIZ63YqFoErqi+XCFUA/lCThPxg4VIHfdU+v
	vhO2WuakjGL1pDZ+O4NxemKDfyfDvTe9/wAJF6NBj8yfxSP5Fkyo+OBpycoQUBdKYaLf
	G0nA==
MIME-Version: 1.0
X-Received: by 10.202.108.84 with SMTP id h81mr29515275oic.90.1427078886368;
	Sun, 22 Mar 2015 19:48:06 -0700 (PDT)
Received: by 10.76.4.173 with HTTP; Sun, 22 Mar 2015 19:48:06 -0700 (PDT)
In-Reply-To: <CACrgodc_kHhwEqxVJOVHBwbcFDmxtPnkOhj14u4VkWJJnQrNPw@mail.gmail.com>
References: <CACrgodc_kHhwEqxVJOVHBwbcFDmxtPnkOhj14u4VkWJJnQrNPw@mail.gmail.com>
Date: Mon, 23 Mar 2015 10:48:06 +0800
Message-ID: <CACrgodeeQszO9EHrxAaesAbKUCWo_W5yRw+U4xuyqBidEpdE2Q@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: build kvm error global name 'incompatible_license_contains' is not defined
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
X-List-Received-Date: Mon, 23 Mar 2015 02:48:11 -0000
Content-Type: multipart/alternative; boundary=001a1142eb7616ab340511ebb2ee

--001a1142eb7616ab340511ebb2ee
Content-Type: text/plain; charset=UTF-8

>
> Im trying to build a yocto image with kvm support according to
> https://wiki.yoctoproject.org/wiki/Virtualization_with_KVM
>
> but " $ bitbake kvm-image-minimal " got following error:
> any configuration I missed?
>
> Eddy
>
> ----------------------------------------------------------------------------------------------
>
> ERROR: Error executing a python function in
> <code>:
> | ETA:  00:01:03
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: '<code>', lineno: 10, function: <module>
>      0006:__anon_33__media_isan_data_poky_meta_classes_devshell_bbclass(d)
>      0007:__anon_86__media_isan_data_poky_meta_classes_sstate_bbclass(d)
>      0008:__anon_45__media_isan_data_poky_meta_classes_blacklist_bbclass(d)
>      0009:__anon_139__media_isan_data_poky_meta_classes_siteinfo_bbclass(d)
>  ***
> 0010:__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d)
> File:
> '__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
> lineno: 2, function:
> __anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
>      0001:def
> __anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
>  *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) == "x"
> or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
>      0003:        d.setVar("EXTRA_OECMAKE",
> d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
>      0004:        d.setVar("DEPENDS", " ".join(i for i in
> d.getVar("DEPENDS").split() if i != "gconf"))
>      0005:
> Exception: NameError: global name 'incompatible_license_contains' is not
> defined
>
> ERROR: Failed to parse recipe:
> /media/isan/data/poky/oe-core/meta/recipes-support/libproxy/
> libproxy_0.4.11.bb
>
> Summary: There were 45 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
>

--001a1142eb7616ab340511ebb2ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><br>Im tryin=
g to build a yocto image with kvm support according to <br><a href=3D"https=
://wiki.yoctoproject.org/wiki/Virtualization_with_KVM" target=3D"_blank">ht=
tps://wiki.yoctoproject.org/wiki/Virtualization_with_KVM</a><br><br></div>b=
ut &quot; $ bitbake kvm-image-minimal &quot; got following error:<br></div>=
any configuration I missed?<br><br></div>Eddy<br><div><div>----------------=
---------------------------------------------------------------------------=
---<br><br>ERROR: Error executing a python function in &lt;code&gt;:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | ETA:=C2=A0 00:01:03<br><br>The stack trace of python calls that resulted=
 in this exception/failure was:<br>File: &#39;&lt;code&gt;&#39;, lineno: 10=
, function: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_33__medi=
a_isan_data_poky_meta_classes_devshell_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0007:__anon_86__media_isan_data_poky_meta_classes_sstate_bbclass(d)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0008:__anon_45__media_isan_data_poky_meta_classes_=
blacklist_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0009:__anon_139__media_isa=
n_data_poky_meta_classes_siteinfo_bbclass(d)<br>=C2=A0*** 0010:__anon_35__m=
edia_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_b=
b(d)<br>File: &#39;__anon_35__media_isan_data_poky_oe_core_meta_recipes_sup=
port_libproxy_libproxy_0_4_11_bb&#39;, lineno: 2, function: __anon_35__medi=
a_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 0001:def __anon_35__media_isan_data_poky_oe_core=
_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):<br>=C2=A0*** 0002:=C2=
=A0=C2=A0=C2=A0 if incompatible_license_contains(&quot;GPLv3&quot;, &quot;x=
&quot;, &quot;&quot;, d) =3D=3D &quot;x&quot; or bb.utils.contains(&quot;DI=
STRO_FEATURES&quot;, &quot;x11&quot;, &quot;x&quot;, &quot;&quot;, d) =3D=
=3D &quot;&quot;:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0003:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.setVar(&quot;EXTRA_OECMAKE&quot;, d.getVar(&quot;EXTRA=
_OECMAKE&quot;).replace(&quot;-DWITH_GNOME=3Dyes&quot;, &quot;-DWITH_GNOME=
=3Dno&quot;))<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d.setVar(&quot;DEPENDS&quot;, &quot; &quot;.join(i for i in=
 d.getVar(&quot;DEPENDS&quot;).split() if i !=3D &quot;gconf&quot;))<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0005:<br>Exception: NameError: global name &#39;incom=
patible_license_contains&#39; is not defined<br><br>ERROR: Failed to parse =
recipe: /media/isan/data/poky/oe-core/meta/recipes-support/libproxy/<a href=
=3D"http://libproxy_0.4.11.bb" target=3D"_blank">libproxy_0.4.11.bb</a><br>=
<br>Summary: There were 45 WARNING messages shown.<br>Summary: There were 2=
 ERROR messages shown, returning a non-zero exit code.<br><br></div></div><=
/div>
</blockquote></div><br></div></div>

--001a1142eb7616ab340511ebb2ee--
