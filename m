Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F3AFE00D3F; Fri, 22 Jun 2018 11:39:52 -0700 (PDT)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDBE1E00C5B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jun 2018 11:39:50 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id a13-v6so9763060lfk.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jun 2018 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A19jEg0jk/ND73QS1Es1AN7N7vpwi3RXon3ktgMzX3I=;
	b=aSjoRC57+ZXDcOk+S09vJgiy37JBnoyOp+vFjEWJnyxLqLW2Hgbu6Dl8wHL7K4XHim
	sWRskkXTJwyqJMVZgNNrO9qi9TaTqiR7ZuY4sTNxLm85m/MWEQSSwO73FI1VFMqLoe3x
	9sYDa3x5px6rbvD1sSD2OSw2v4yKBwKRc3SUVYslM9/WiFb26QQDuqq9cP7kYB4R9D8v
	DhY+of8QnxdYrDJsRnWOaqjctURG5dBIlvyaLCPAP5+MyMVe3XFR9btMhDCh/lXpzHhL
	kq0CPuhlpTz+8FoCWF7LNCfiGKX/ZZr84RqgT+o/1Ne5HOEg7Eub7n/dunOfP3BXWSJr
	4kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A19jEg0jk/ND73QS1Es1AN7N7vpwi3RXon3ktgMzX3I=;
	b=F5inAv/hKhPg33Xkl30QTafcASqhLveltdqnXVWXSFN9Wl+IoqaRRZxlHX3S2kI2y0
	7hTQM7k9YrzjyGSqcDTYIqdFqgKz+9MxTRav7/jLPbKkM7/IG8ZUMz+mHdh1e/o8+fNd
	yCZu1iuaPHt2YEnZQIx0SHyoRhXXTXJ8N81G60o1XTxOzrNQRaES7NLcX2gLD0Uf5Wtl
	BaNIwdkvB+aO7yxYjWNUgYl2IiNMphTBELnFK8tS8wqCDoHWE+RDs2He18A2DoetA4gI
	Sn2IFa+2KBhVfwC1LggBG9xmuhAuphtOiUiGyHlZI0nMMf0a6MkyxRNklS4JbNceO8mf
	V6sA==
X-Gm-Message-State: APt69E3We11pkaUoWin6OZj8wt7w/ngNkvjU34OjaNFWRvFnVGqmglpv
	u3vh2z3q2shDqH473mBJfHnKuou/nzL3TZXbxYq8ZA==
X-Google-Smtp-Source: ADUXVKIX8tmuMP2JnAiDkdexUzPZJhmyni2/6RObZtjTueVC0H+y4zmLUXWtcsafGUok36I7xD+iLU5yaeShKeoU8VE=
X-Received: by 2002:a19:9115:: with SMTP id t21-v6mr2210lfd.94.1529692789714; 
	Fri, 22 Jun 2018 11:39:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:17ca:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 11:39:49
	-0700 (PDT)
In-Reply-To: <20180621082659.55476-1-psaavedra@igalia.com>
References: <20180621082659.55476-1-psaavedra@igalia.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 22 Jun 2018 14:39:49 -0400
Message-ID: <CADkTA4NKs3vPMAQuOxz73a-sP3Z5w2+E1jgpSHR634SSdnMJ6A@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] Ruby-shadow upgrade to 2.5.0
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
X-List-Received-Date: Fri, 22 Jun 2018 18:39:52 -0000
Content-Type: multipart/alternative; boundary="00000000000058b755056f3f5b5a"

--00000000000058b755056f3f5b5a
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 21, 2018 at 4:26 AM, Pablo Saavedra <psaavedra@igalia.com>
wrote:

> Ruby was upgraded to 2.5.0 in sumo. A upgrade in the ruby-shadow is
> needed to build
>
> Upstream changes:
>
> * Updates code source reference
> * Fixes for rubinius and tests
> * Add friendlier method names
> * Start to add some smoke tests
> * Provide info on implementation
>
> Finally, this version of the package is alrady added in Debian Buster
> as well.
> ---
>  recipes-support/ruby-shadow/ruby-shadow_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> index 75588f3..e7db6d1 100644
> --- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> +++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> @@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/apalmblad/ruby-shadow"
>  LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=137882914e5269b7268f0fe8e28a3f89"
>
> -PV = "2.4.1"
> +PV = "2.5.0"
>
>  SRC_URI = "git://github.com/apalmblad/ruby-shadow.git"
> -SRCREV = "4231a4838fd50022b112838f114ee0586e119605"
> +SRCREV = "d2e822d8a8bda61f0774debbfce363a7347ed893"
>  S = "${WORKDIR}/git"
>
>  inherit ruby
> --
> 2.11.0
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

--00000000000058b755056f3f5b5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 21, 2018 at 4:26 AM=
, Pablo Saavedra <span dir=3D"ltr">&lt;<a href=3D"mailto:psaavedra@igalia.c=
om" target=3D"_blank">psaavedra@igalia.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Ruby was upgraded to 2.5.0 in sumo. A upgrade in th=
e ruby-shadow is<br>
needed to build<br>
<br>
Upstream changes:<br>
<br>
* Updates code source reference<br>
* Fixes for rubinius and tests<br>
* Add friendlier method names<br>
* Start to add some smoke tests<br>
* Provide info on implementation<br>
<br>
Finally, this version of the package is alrady added in Debian Buster<br>
as well.<br>
---<br>
=C2=A0recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ru<wbr>by-shadow_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.=
bb" rel=3D"noreferrer" target=3D"_blank"><wbr>ruby-shadow_git.bb</a> b/reci=
pes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=3D"norefe=
rrer" target=3D"_blank"><wbr>ruby-shadow_git.bb</a><br>
index 75588f3..e7db6d1 100644<br>
--- a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>ruby-shadow_git.bb</a><br>
+++ b/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>ruby-shadow_git.bb</a><br>
@@ -3,10 +3,10 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/apalmbla=
d/ruby-shadow" rel=3D"noreferrer" target=3D"_blank">https://github.com/apal=
mblad/<wbr>ruby-shadow</a>&quot;<br>
=C2=A0LICENSE =3D &quot;PD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>137882914e5269b7=
268f0fe8e28a3f<wbr>89&quot;<br>
<br>
-PV =3D &quot;2.4.1&quot;<br>
+PV =3D &quot;2.5.0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/apalmblad/ruby-s=
hadow.git" rel=3D"noreferrer" target=3D"_blank">github.com/apalmblad/<wbr>r=
uby-shadow.git</a>&quot;<br>
-SRCREV =3D &quot;<wbr>4231a4838fd50022b112838f114ee0<wbr>586e119605&quot;<=
br>
+SRCREV =3D &quot;<wbr>d2e822d8a8bda61f0774debbfce363<wbr>a7347ed893&quot;<=
br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit ruby<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.0<br>
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

--00000000000058b755056f3f5b5a--
