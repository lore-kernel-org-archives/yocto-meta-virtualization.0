Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D520E00A9B; Fri, 20 Jan 2017 06:01:02 -0800 (PST)
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
	*      [209.85.213.177 listed in list.dnswl.org]
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67E10E00A3B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:58 -0800 (PST)
Received: by mail-yb0-f177.google.com with SMTP id w194so54802510ybe.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vUXSZjoRpYpqL58LC5Xj9o1ugxiVX3G9QWbZH5GeTOc=;
	b=RcOcPbRHykD8aRxnwPGyt6GwFaeas0JrQqh6f5ii7aJ0RkfASCX+X4QkHq19H3hI5y
	saalCBEuOYIU/3OowsttOyvipgzgSzVuHYB0o1goEvpySIe3M0x11rlWebglcJKrKxmx
	W0/+2yVmRR6bKxn+GRrpCx7YdXPuW0kVs80j0paQbfgQZt9apm9vETKsINMjDLNOnNJM
	rj0AzmigC0aCHM032WQKH4T6NJgPJpCzRkW1nMudBmCTZJDhXLuZzAr8/+dszOhMMtnV
	pkxEj0df8zeiIB6lj+x1rl0c3SvVex21ZpE6vpunwj9BYS3P4OPpr65f7iNCC2ktVrlS
	I84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vUXSZjoRpYpqL58LC5Xj9o1ugxiVX3G9QWbZH5GeTOc=;
	b=p92xdyZXj+RO/5/sNd3+YJrQ80wMfQt7K0q8dqjDA0oDxztAqf+vp1TShQELSiio/u
	uwwAi8/K0PfcHM506ySlYcP5mcfembV7ic7pkuDWr6VcMQ2X24FtB9xmBVKfAwLxZlCl
	lU3uPVHf2lRX8nyuFzALGuDCe47Lq9vshLpN56dNWl3xy0mCUPGJzfqkqgUk4k24N6ND
	PwJc5Ex+sAdOmQl/0dnQzGRGM/Kr4BCr4qe0VWt3/pt4nSJwghXfGvgLKoR2EAh7t5RC
	Se6kGZRL490Nn1etyD4psjperejeuZJLDOt3ZW4Sf3NB7dtIQvcnFJ5b+Tai+rHjgWrB
	Ra3w==
X-Gm-Message-State: AIkVDXJuC8D/YMfRXvjbKZn2yXjEqT6Mz2maHH0+3u/hFpqhactwwAbm/Z1S0MoYZHCezU6pnwJ4ws6tRztNlQ==
X-Received: by 10.237.38.65 with SMTP id z59mr12101414qtc.5.1484920858368;
	Fri, 20 Jan 2017 06:00:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 20 Jan 2017 06:00:57 -0800 (PST)
In-Reply-To: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
References: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2017 09:00:57 -0500
Message-ID: <CADkTA4MJGZ9xORLd52hHAh8YK6WkVj7dOPsEitmEndnR5+-gww@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [0/2] python-sqlalchemy uprev / new version
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
X-List-Received-Date: Fri, 20 Jan 2017 14:01:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e58486301054687142f

--94eb2c122e58486301054687142f
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Jan 19, 2017 at 2:33 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> There are two distinct active release series of the python sqlalchemy
> package (1.0.x and 1.1.x). For some packages, like docker-registry
> there appears to be no incompatibility issues when using the 1.0.x vs
> the 1.1.x series, however, there are openstack packages which are only
> compatible with the 1.0.x series. As such we can add the recipes to
> build the 1.1.x series but for now we will leave the 1.0.x series in
> place for those packages which require it.
>
> Huang Qiyu's original uprev to 1.1.5 has been modified to leave 1.0.9
> in place and I have included a second commit to uprev to the latest
> stable release in the 1.0.x series.
>
> Huang Qiyu please have a look and agree to these changes, since I left
> your signoff in place I don't want Bruce to merge this until you are
> comfortable with my changes.
>
> Regards,
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c122e58486301054687142f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Jan 19, 2017 at 2:33 PM, M=
ark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@wind=
river.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">There are two distinct active relea=
se series of the python sqlalchemy<br>
package (1.0.x and 1.1.x). For some packages, like docker-registry<br>
there appears to be no incompatibility issues when using the 1.0.x vs<br>
the 1.1.x series, however, there are openstack packages which are only<br>
compatible with the 1.0.x series. As such we can add the recipes to<br>
build the 1.1.x series but for now we will leave the 1.0.x series in<br>
place for those packages which require it.<br>
<br>
Huang Qiyu&#39;s original uprev to 1.1.5 has been modified to leave 1.0.9<b=
r>
in place and I have included a second commit to uprev to the latest<br>
stable release in the 1.0.x series.<br>
<br>
Huang Qiyu please have a look and agree to these changes, since I left<br>
your signoff in place I don&#39;t want Bruce to merge this until you are<br=
>
comfortable with my changes.<br>
<br>
Regards,<br>
Mark<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c122e58486301054687142f--
