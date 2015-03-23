Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0D02E00949; Sun, 22 Mar 2015 19:26:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.41 listed in list.dnswl.org]
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15081E0084F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:26:19 -0700 (PDT)
Received: by oigv203 with SMTP id v203so130113749oig.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=M2JcgkAv+BoFY/bHXH1Eir7FHWdfqYLm0BeEFqNPZzk=;
	b=VCspAGXpQ/31O6w0csGvv52aLNK/stMDwUeR+BHA/fPsYr5ZwFYslT3R5i4edqL4SI
	3Ndn3JLvkgl5UqV6iA48QBpgsmC/6evVO88Eo1L7UIaEPHOA0Rsymg8pJsZdt99q7aDX
	C1IFEeJ612RrsyVh0sxFIQjym9Dg/R/IidAWkx2Kcu0gERXMIoD+eS7elsXXL0X19ND0
	l6GQHsUoh+X42ez0xa1MLr0tv8jazQ+fB5QVvFyGBOp7C/ElQ7H6k5U3MOoT9e5lq2jo
	e3zEfjX/ldamxJJQrNhNlEERQSqMxJXoSCetF+I6wA4kkR9hzC/NOyqCvXD1aPbMTjhs
	iFIA==
MIME-Version: 1.0
X-Received: by 10.202.108.84 with SMTP id h81mr29473305oic.90.1427077578933;
	Sun, 22 Mar 2015 19:26:18 -0700 (PDT)
Received: by 10.76.4.173 with HTTP; Sun, 22 Mar 2015 19:26:18 -0700 (PDT)
Message-ID: <CACrgodc_kHhwEqxVJOVHBwbcFDmxtPnkOhj14u4VkWJJnQrNPw@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
To: meta-virtualization@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: build kvm error global name 'incompatible_license_contains' is not defined
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
Date: Mon, 23 Mar 2015 02:26:23 -0000
X-Original-Date: Mon, 23 Mar 2015 10:26:18 +0800
X-List-Received-Date: Mon, 23 Mar 2015 02:26:23 -0000
Content-Type: multipart/alternative; boundary=001a1142eb7628cd420511eb644d

--001a1142eb7628cd420511eb644d
Content-Type: text/plain; charset=UTF-8

Im trying to build a yocto image with kvm support according to
https://wiki.yoctoproject.org/wiki/Virtualization_with_KVM

but " $ bitbake kvm-image-minimal " got following error:
any configuration I missed?

Eddy
----------------------------------------------------------------------------------------------

ERROR: Error executing a python function in
<code>:
| ETA:  00:01:03

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 10, function: <module>
     0006:__anon_33__media_isan_data_poky_meta_classes_devshell_bbclass(d)
     0007:__anon_86__media_isan_data_poky_meta_classes_sstate_bbclass(d)
     0008:__anon_45__media_isan_data_poky_meta_classes_blacklist_bbclass(d)
     0009:__anon_139__media_isan_data_poky_meta_classes_siteinfo_bbclass(d)
 ***
0010:__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d)
File:
'__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
lineno: 2, function:
__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
     0001:def
__anon_35__media_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
 *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) == "x"
or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
     0003:        d.setVar("EXTRA_OECMAKE",
d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
     0004:        d.setVar("DEPENDS", " ".join(i for i in
d.getVar("DEPENDS").split() if i != "gconf"))
     0005:
Exception: NameError: global name 'incompatible_license_contains' is not
defined

ERROR: Failed to parse recipe:
/media/isan/data/poky/oe-core/meta/recipes-support/libproxy/
libproxy_0.4.11.bb

Summary: There were 45 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--001a1142eb7628cd420511eb644d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><br>Im trying to build a yocto image with k=
vm support according to <br><a href=3D"https://wiki.yoctoproject.org/wiki/V=
irtualization_with_KVM">https://wiki.yoctoproject.org/wiki/Virtualization_w=
ith_KVM</a><br><br></div>but &quot; $ bitbake kvm-image-minimal &quot; got =
following error:<br></div>any configuration I missed?<br><br></div>Eddy<br>=
<div><div>-----------------------------------------------------------------=
-----------------------------<br><br>ERROR: Error executing a python functi=
on in &lt;code&gt;:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 00:01:03<br><br>The stack trace of=
 python calls that resulted in this exception/failure was:<br>File: &#39;&l=
t;code&gt;&#39;, lineno: 10, function: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0006:__anon_33__media_isan_data_poky_meta_classes_devshell_bbclass(d=
)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_86__media_isan_data_poky_meta_cla=
sses_sstate_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0008:__anon_45__media_is=
an_data_poky_meta_classes_blacklist_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 =
0009:__anon_139__media_isan_data_poky_meta_classes_siteinfo_bbclass(d)<br>=
=C2=A0*** 0010:__anon_35__media_isan_data_poky_oe_core_meta_recipes_support=
_libproxy_libproxy_0_4_11_bb(d)<br>File: &#39;__anon_35__media_isan_data_po=
ky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb&#39;, lineno: 2=
, function: __anon_35__media_isan_data_poky_oe_core_meta_recipes_support_li=
bproxy_libproxy_0_4_11_bb<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:def __anon_35__m=
edia_isan_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_b=
b(d):<br>=C2=A0*** 0002:=C2=A0=C2=A0=C2=A0 if incompatible_license_contains=
(&quot;GPLv3&quot;, &quot;x&quot;, &quot;&quot;, d) =3D=3D &quot;x&quot; or=
 bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;x11&quot;, &quot;x&qu=
ot;, &quot;&quot;, d) =3D=3D &quot;&quot;:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0003=
:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;EXTRA_OECMAKE&qu=
ot;, d.getVar(&quot;EXTRA_OECMAKE&quot;).replace(&quot;-DWITH_GNOME=3Dyes&q=
uot;, &quot;-DWITH_GNOME=3Dno&quot;))<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;DEPENDS&quot;, &quot=
; &quot;.join(i for i in d.getVar(&quot;DEPENDS&quot;).split() if i !=3D &q=
uot;gconf&quot;))<br>=C2=A0=C2=A0=C2=A0=C2=A0 0005:<br>Exception: NameError=
: global name &#39;incompatible_license_contains&#39; is not defined<br><br=
>ERROR: Failed to parse recipe: /media/isan/data/poky/oe-core/meta/recipes-=
support/libproxy/<a href=3D"http://libproxy_0.4.11.bb">libproxy_0.4.11.bb</=
a><br><br>Summary: There were 45 WARNING messages shown.<br>Summary: There =
were 2 ERROR messages shown, returning a non-zero exit code.<br><br></div><=
/div></div>

--001a1142eb7628cd420511eb644d--
