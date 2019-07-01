Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA6A1E00D42; Mon,  1 Jul 2019 02:06:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.43 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FD91E00BAF
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Jul 2019 02:06:23 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id k21so3648427edq.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Jul 2019 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Qob5qhzttPtzdfCH4EeFtWigu+atl/xjexzQv1un3gU=;
	b=Un8PphzKlqTqSehWBShPh7dZ9Hn/ljgrQnQVrKPlKNnG4tF6dTTJhdupb1l5tqH6HQ
	XK6zaTwUuVvZUHzmVzfAdzumpoFZtc0fTly1pEaPSpeKfbv6XPa7egQq1oe3VAqQKT2c
	/qFy2Ih2sZmOdPes9w21tk0S7blcSL5IVdfR+pN3FchTAnrctFDBEpc5QxKQo9PU5rGb
	6ZUiWR2DG+vm3NV0HZoVg+3QBPnUX9oMTFvrW3676rNHl3RoiJUCO8l8VYSm1Y5bZ0Eg
	I0QzaCT7tlNGcm+XEm4YBaVELNVLQk6EB4PfZeKUMBuRkTwqw7WX0Yfo/GJZ53tkjjEd
	dCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Qob5qhzttPtzdfCH4EeFtWigu+atl/xjexzQv1un3gU=;
	b=b0XJ8gxSKzII/Fdb3I2Be/AVKb/ZTBJ4DX6jIvZ5JSQyXPw+Pk9X5qc+/fg44VcQzi
	jvf32xNz4zUvOd8roTsIhZnBSUAO1laWVBdGDG8dt6BczcjuEemD6mNBfRKb+1jFeNQS
	gkqCph2opkhwCxK71LjLhXuQvgg90jSjB8UEvjJ6UYLOReBjNHLIOigx5dHDPfHieg0I
	j6nG0dSitqxkZecuE0a3iHUBrJLYRzlw6Oxbl7eGB6BmxKKc9odZafLRYUq5BgsdOHIO
	B7DX4nITT6FUItUOnrGpA23B7WkUbBihGDSCFqVKqUUF+JbrhvJgZdLNUE5JCStrcOyE
	hx1Q==
X-Gm-Message-State: APjAAAWOBxWgChRl9INPncfpZz2Wlh4YYyApDfGfwmbGIDr6d7O4qKTd
	UyhqMoEFZ82Lcemfadcsc+Fpiee4O7L76jHKSQo=
X-Google-Smtp-Source: APXvYqxoBNKzIN7pRh6wF3CEQo/8p7u514LsXxOVjqPigu3BS+4v/q6cxhkEX2uDmcKXG+asQyrN7GbM6fZpq2ZxPJw=
X-Received: by 2002:a50:b64a:: with SMTP id c10mr27423204ede.256.1561971982580;
	Mon, 01 Jul 2019 02:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <1561674444-21344-1-git-send-email-bostancioglucevat@gmail.com>
In-Reply-To: <1561674444-21344-1-git-send-email-bostancioglucevat@gmail.com>
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Mon, 1 Jul 2019 12:06:11 +0300
Message-ID: <CABPcKDMuW_7WwCJzbFnxn+MxnXk4MfTUOiqq+7b0rJa7p9+aGQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@yoctoproject.org
Subject: [PATCH] singularity: openssl cert configs path fixed.
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
X-List-Received-Date: Mon, 01 Jul 2019 09:06:24 -0000
Content-Type: multipart/alternative; boundary="0000000000002bbf8f058c9af121"

--0000000000002bbf8f058c9af121
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, did you guys checked this patch?
Cevat

---------- Forwarded message ---------
G=C3=B6nderen: Cevat Bostancioglu <bostancioglucevat@gmail.com>
Date: 28 Haz 2019 Cum, 01:27
Subject: [meta-virtualization][PATCH] singularity: openssl cert configs
path fixed.
To: <meta-virtualization@yoctoproject.org>
Cc: Cevat Bostancioglu <bostancioglucevat@gmail.com>


openssl recipe moves ssl-1.1 directory as ssl , singularity recipe cannot
find ssl-1.1 path.
---
 recipes-containers/singularity/singularity_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/singularity/singularity_git.bb
b/recipes-containers/singularity/singularity_git.bb
index 6fee8f3..e50052c 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -30,6 +30,6 @@ pkg_postinst_${PN}() {

     # python3 expects CA certificates to be installed in a different place
to where
     # they are actually installed. These lines link the two locations.
-    rm -r $D${libdir}/ssl-1.1/certs
-    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1
+    rm -r $D${libdir}/ssl/certs
+    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
 }
--=20
2.7.4

--0000000000002bbf8f058c9af121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, did you guys checked this patch?<div>Cevat<br><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">------=
---- Forwarded message ---------<br>G=C3=B6nderen: <strong class=3D"gmail_s=
endername" dir=3D"auto">Cevat Bostancioglu</strong> <span dir=3D"auto">&lt;=
<a href=3D"mailto:bostancioglucevat@gmail.com">bostancioglucevat@gmail.com<=
/a>&gt;</span><br>Date: 28 Haz 2019 Cum, 01:27<br>Subject: [meta-virtualiza=
tion][PATCH] singularity: openssl cert configs path fixed.<br>To:  &lt;<a h=
ref=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoc=
toproject.org</a>&gt;<br>Cc: Cevat Bostancioglu &lt;<a href=3D"mailto:bosta=
ncioglucevat@gmail.com">bostancioglucevat@gmail.com</a>&gt;<br></div><br><b=
r>openssl recipe moves ssl-1.1 directory as ssl , singularity recipe cannot=
 find ssl-1.1 path.<br>
---<br>
=C2=A0recipes-containers/singularity/<a href=3D"http://singularity_git.bb" =
rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/singularity/<a href=3D"http://singularity_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> b/recipe=
s-containers/singularity/<a href=3D"http://singularity_git.bb" rel=3D"noref=
errer" target=3D"_blank">singularity_git.bb</a><br>
index 6fee8f3..e50052c 100644<br>
--- a/recipes-containers/singularity/<a href=3D"http://singularity_git.bb" =
rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
+++ b/recipes-containers/singularity/<a href=3D"http://singularity_git.bb" =
rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
@@ -30,6 +30,6 @@ pkg_postinst_${PN}() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# python3 expects CA certificates to be installed in a =
different place to where<br>
=C2=A0 =C2=A0 =C2=A0# they are actually installed. These lines link the two=
 locations.<br>
-=C2=A0 =C2=A0 rm -r $D${libdir}/ssl-1.1/certs<br>
-=C2=A0 =C2=A0 ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1 <br>
+=C2=A0 =C2=A0 rm -r $D${libdir}/ssl/certs<br>
+=C2=A0 =C2=A0 ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl<br>
=C2=A0}<br>
-- <br>
2.7.4<br>
<br>
</div></div></div></div>

--0000000000002bbf8f058c9af121--
