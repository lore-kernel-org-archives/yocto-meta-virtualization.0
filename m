Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A2A8E00BCE; Tue,  7 Jun 2016 06:23:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
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
	*      [209.85.218.66 listed in list.dnswl.org]
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3CE7E00B5F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Jun 2016 06:23:03 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id n3so14520237oig.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Jun 2016 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rqi3eqEnd2MubRsti17NmyEOmA7UQu0mykhTxkXgCCE=;
	b=fTWjln/ReahTjywCSRy31eik6pJ+bdgs2OXohqeQZciR/z//k+YMo6w8HVDc8/cu97
	W6GP0BF6MbeT1XiK8qdgKZ2Y4rOOedsBObS2RobS2wh92CiKHPD6QIt3Le0BrjG0Kke4
	ytrpGCLHqq10dRsDTM/qFZ5zHQ/w6rFFMKiuPhKLfWiTDQy4HeA4jxhq+1BFQoOvz3SP
	NNTuFCrHZ3YTV3UFIQMFBEOmvHhKEOctHXkvKM0/bEA+yJrVu+DqpGPl+6LwPMVRMTre
	JqP42cSw2WCPevYBL1vrM4WJNghuN2WsQ6alfmhNzw2Vp0TGLPSusuv8cOd0heV2/IL2
	EHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rqi3eqEnd2MubRsti17NmyEOmA7UQu0mykhTxkXgCCE=;
	b=R9tB2apy8ZOAUnDlOvlgtFFvw7PMzCX0VEL0/AiJPXNd9T5NohUl69WuOdC7odSlvo
	LE3cJJv9IT2e3YtYz2tPeLXfNcP3LpwaO0AA5ehrlsjri6xv0s500/HtLuXv+YXX1+dV
	tQ+qlZNJWM0vapQtp4Zsx3foSB6Xgp9FTjqMpVrO2blhNp2V0TKD5SBf8v9I1N3qkNCW
	+3jU0MMrjwaFXy5vPm6YkV+0QL126PZqbLeoBHNmid7gnFnXjGAN3LCQ1B5Yqb0dbGQE
	GUamTHFPshupRChi9UeHyXNUjvJIhGyhRIQdhffPn6tf9PdPKj3yLtwbTV4Y34ANSiN/
	a0eg==
X-Gm-Message-State: ALyK8tKkvbTgjQGy1Hqk/zFdOmqMbkOQ8qzwW+L3vici4aty70/7Fttkc+LW8en6AO23CvertLvmUMPaoIVnww==
X-Received: by 10.157.51.21 with SMTP id f21mr10717684otc.8.1465305782419;
	Tue, 07 Jun 2016 06:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Tue, 7 Jun 2016 06:23:01 -0700 (PDT)
In-Reply-To: <1465264026-66571-1-git-send-email-xulin.sun@windriver.com>
References: <1465264026-66571-1-git-send-email-xulin.sun@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jun 2016 09:23:01 -0400
Message-ID: <CADkTA4P1cJ=v0sW6rRjJt8oQ20kox=gnuJtX0DcBTwb2HkLpqw@mail.gmail.com>
To: Xulin Sun <xulin.sun@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-keystone: fix QA warning of host uid contamination
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
X-List-Received-Date: Tue, 07 Jun 2016 13:23:05 -0000
Content-Type: multipart/alternative; boundary=001a113e1bf0a605190534b016ab

--001a113e1bf0a605190534b016ab
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 6, 2016 at 9:47 PM, Xulin Sun <xulin.sun@windriver.com> wrote:

> QA Issue: python-keystone:
>
> /keystone/usr/share/openstack-dashboard/openstack_dashboard/api/keystone-httpd.py
> is owned by gid 100, which is the same as the user running bitbake. This
> may be
> due to host contamination [host-user-contaminated]
>

merged.

Bruce


>
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-keystone_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> index a8d1181..4bd739a 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> @@ -91,11 +91,11 @@ do_install_append() {
>          ${KEYSTONE_CONF_DIR}/policy.json
>      install -m 644 ${S}${sysconfdir}/keystone-paste.ini \
>          ${KEYSTONE_CONF_DIR}/keystone-paste.ini
> -    install -g users -m 644 ${S}/httpd/keystone.py \
> +    install -m 644 ${S}/httpd/keystone.py \
>          ${KEYSTONE_PY_DIR}/keystone-httpd.py
> -    install -g users -m 644 ${S}/httpd/keystone.py \
> +    install -m 644 ${S}/httpd/keystone.py \
>          ${KEYSTONE_CGI_DIR}/admin
> -    install -g users -m 644 ${S}/httpd/keystone.py \
> +    install -m 644 ${S}/httpd/keystone.py \
>          ${KEYSTONE_CGI_DIR}/main
>
>      cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}
> --
> 2.5.0
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

--001a113e1bf0a605190534b016ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 6, 2016 at 9:47 PM, Xulin Sun <span dir=3D"ltr">&lt;<a href=
=3D"mailto:xulin.sun@windriver.com" target=3D"_blank">xulin.sun@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">QA Issue: python=
-keystone:<br>
/keystone/usr/share/openstack-dashboard/openstack_dashboard/api/keystone-ht=
tpd.py<br>
is owned by gid 100, which is the same as the user running bitbake. This ma=
y be<br>
due to host contamination [host-user-contaminated]<br></blockquote><div><br=
></div><div>merged.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.com">xul=
in.sun@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-keyst=
one_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb</a>=
 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-keystone_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystone_git=
.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-k=
eystone_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb=
</a><br>
index a8d1181..4bd739a 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-keyst=
one_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb</a>=
<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-keyst=
one_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb</a>=
<br>
@@ -91,11 +91,11 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KEYSTONE_CONF_DIR}/policy.json<br>
=C2=A0 =C2=A0 =C2=A0install -m 644 ${S}${sysconfdir}/keystone-paste.ini \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KEYSTONE_CONF_DIR}/keystone-paste.ini<b=
r>
-=C2=A0 =C2=A0 install -g users -m 644 ${S}/httpd/keystone.py \<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/httpd/keystone.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KEYSTONE_PY_DIR}/keystone-httpd.py<br>
-=C2=A0 =C2=A0 install -g users -m 644 ${S}/httpd/keystone.py \<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/httpd/keystone.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KEYSTONE_CGI_DIR}/admin<br>
-=C2=A0 =C2=A0 install -g users -m 644 ${S}/httpd/keystone.py \<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/httpd/keystone.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KEYSTONE_CGI_DIR}/main<br>
<br>
=C2=A0 =C2=A0 =C2=A0cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a113e1bf0a605190534b016ab--
