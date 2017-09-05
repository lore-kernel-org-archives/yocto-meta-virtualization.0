Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55485E00C09; Tue,  5 Sep 2017 10:27:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29230E009F5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Sep 2017 10:27:53 -0700 (PDT)
Received: by mail-ua0-f194.google.com with SMTP id g47so1485052uad.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Sep 2017 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6UwksfFbLIitmitaw0cJguHMmPhTDjQ/FC9ANTdRUKw=;
	b=XXXYjKQH6z40Kd4Wa+/Oh9l/bogtnilY9BVBvZHaP0tZzWfQJ0cTiskbU+dLXkYcFH
	7gaSxTzPmzvmjm5v4LwIlf8H5zofaJwj7R0plWmJnZuO6t3pLh6KRVSxrGyiI/7rKnqo
	iNkvwjIWQsnjy6u9xmjw9QVTYGl8NxmTsnMW+y7mn4H4tDpkiAMyLP7gxFUPuCjsZZec
	Xu2CKuAK4RZreT/sX2eLVn0cmP6YjGJCXmeKGsciWc+SZkbZsDyjMw47XhPpIYioYhZV
	XAJknEqtc8C/KRK3tN4yy+TYXqdru3eRFy/3BYJeRCZE3bF6uEMPrYFvbJRR7JXQw7YF
	Sc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6UwksfFbLIitmitaw0cJguHMmPhTDjQ/FC9ANTdRUKw=;
	b=TzfptA77yNyn5Dhfb9DxQcmofRFzHrTsTMEJGbCwLQi90+F/TQgScABu0iPTLf+WL0
	YBXirWsO2WFScEVJrexntR53cCs+c83Bt6o1uXSeeneOCag7BLXfnQZwPFUTteSX6Uql
	sVANX5fkhyB8MNeZVbYgzcX1NTc1Fv1gtTco52x3nxcwBp8lQffQOVAS9m3UkBali0Gj
	h9Y5KX8VC6+SzwhI7bGwa5FXqRg6CgXAmfuW40NurQMYdQjX1xKzcFVRBTWt63p6rNnH
	W42nXM82FTE9S5zdMEt8Of3OIyMw4/++u76LdpxjWvV7j3Vm2ca/f/1zP9LlWaiAwP5/
	F3hA==
X-Gm-Message-State: AHPjjUglyYEUOBpHMsBSLuKorRar7DqZ4Y07r7L6Bsta6Zdhrpk4bDiz
	YELhmFWDDZyW5raT35kiTPR/jELgSA==
X-Google-Smtp-Source: ADKCNb44gp2LVcMdZvt5IcbtYKpcKz+kEwXhjgT80KWtot0hBd+JjVgEhPkO0Z/6tJ5zyw0sq3n0xex+djwl+xmDWjk=
X-Received: by 10.176.91.156 with SMTP id y28mr3075905uae.71.1504632473273;
	Tue, 05 Sep 2017 10:27:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 5 Sep 2017 10:27:52 -0700 (PDT)
In-Reply-To: <1504278682-99314-1-git-send-email-tiniuc.alexandru@gmail.com>
References: <1504278682-99314-1-git-send-email-tiniuc.alexandru@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Sep 2017 13:27:52 -0400
Message-ID: <CADkTA4Ox03go-yi=chaeq82QMdc+NxVhxcEm7mwgiNZqe9Uw2Q@mail.gmail.com>
To: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] singularity: Added dependency to e2fsprogs-mke2fs
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
X-List-Received-Date: Tue, 05 Sep 2017 17:27:55 -0000
Content-Type: multipart/alternative; boundary="f403045f883e164bef0558748cb0"

--f403045f883e164bef0558748cb0
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Sep 1, 2017 at 11:11 AM, Alexandru Tiniuc <
tiniuc.alexandru@gmail.com> wrote:

> While the recipe was functional under an image based on core-image-
> full-cmdline, when tested with core-image-minimal runtime issues
> appeared: Singularity was unable to create a filesystem within the
> container. This change fixes this issue.
>
> Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
> ---
>  recipes-containers/singularity/singularity_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/singularity/singularity_git.bb
> b/recipes-containers/singularity/singularity_git.bb
> index 8b97740..6fee8f3 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -2,7 +2,7 @@
>  # Singularity build / config: read up on the dev-so test for more info)
>  INSANE_SKIP_${PN} += "dev-so"
>
> -RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash"
> +RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash
> e2fsprogs-mke2fs"
>  # Singularity expects to find python3 under the name python, therefore
> both
>  # cannot be installed at the same time.
>  RCONFLICTS_${PN} = "python"
> --
> 2.1.4
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

--f403045f883e164bef0558748cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep 1, 2017 at 11:11 AM=
, Alexandru Tiniuc <span dir=3D"ltr">&lt;<a href=3D"mailto:tiniuc.alexandru=
@gmail.com" target=3D"_blank">tiniuc.alexandru@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">While the recipe was functional under=
 an image based on core-image-<br>
full-cmdline, when tested with core-image-minimal runtime issues<br>
appeared: Singularity was unable to create a filesystem within the<br>
container. This change fixes this issue.<br>
<br>
Signed-off-by: Alexandru Tiniuc &lt;<a href=3D"mailto:tiniuc.alexandru@gmai=
l.com">tiniuc.alexandru@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/<wbr>singularity/<a href=3D"http://singular=
ity_git.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> b/r=
ecipes-containers/<wbr>singularity/<a href=3D"http://singularity_git.bb" re=
l=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
index 8b97740..6fee8f3 100644<br>
--- a/recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
+++ b/recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
@@ -2,7 +2,7 @@<br>
=C2=A0# Singularity build / config: read up on the dev-so test for more inf=
o)<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
<br>
-RDEPENDS_${PN} +=3D &quot;glibc python3 ca-certificates openssl bash&quot;=
<br>
+RDEPENDS_${PN} +=3D &quot;glibc python3 ca-certificates openssl bash e2fsp=
rogs-mke2fs&quot;<br>
=C2=A0# Singularity expects to find python3 under the name python, therefor=
e both<br>
=C2=A0# cannot be installed at the same time.<br>
=C2=A0RCONFLICTS_${PN} =3D &quot;python&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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
</div>

--f403045f883e164bef0558748cb0--
