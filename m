Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E1B6E00C89; Fri, 15 Apr 2016 09:30:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09A58E006D3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Apr 2016 09:30:05 -0700 (PDT)
Received: by mail-ob0-f175.google.com with SMTP id bg3so67046706obb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Apr 2016 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=eUBvscnruaohBONYsJQwxgcLulXejL0ZYC0t9omiuHE=;
	b=jvXBOsWAmOE3YlzT+5a5GVvlqszjHdeIQPsntdJVc+4EIW7EbByW7w3wPXZ3EonFMC
	NDqfxLSWZzCKnHY6twYx7OA4rJPozSB4luTptuPEO0Vwx9vouHJ4YQ2KHxaJF6xJo+o3
	3F0sHUHtZI4PtCAX3E0mM339/peuiNF0jCkMannoyV9KG0VlWaJvYX9iQCBiIxRFKAjE
	E+GUFqDzqziYyfNgEeb2Gqfs6nE/NbHWKM7vpaV+RyobPXbm2dyp0vRMgHH+y/N+L66U
	j47St8pt+nC3WzcdWkK0Z8/eCdpWyGb9UBtjNYRURYZDDzosM1TMm59jWnWSCpGs5Zi2
	2q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=eUBvscnruaohBONYsJQwxgcLulXejL0ZYC0t9omiuHE=;
	b=dc3mfyoBd9P/tvGFGNsjbNIBCEzVsjSM/x7WHgBMresYjv+cGZ9YxTs7cUovgj5avj
	GKlt/3ilVELxkYOzCj+yH4ubuw4p8QrGBc8YIbqdbdRmTmMa4YrbVgkiD8wCp7LxfPxv
	T3pW73U1YuHN3eCzZmEl/YKD7cLoIytd0TsG5uPkyl57HA+lMPznERZT1gtdrPMrZ7q5
	IFgSVwLW4tD/MNgBx0p2ht2t7uI7PkOOWTaIe0s38cB1ykIxblg9WSdbmLxBQ22WHBad
	vvLvklBxcW/XeAeBZVrMSCtPsnC7PFNvwACi1BqvVbRrM2i7n28++G1wk7EnZR+VLqb3
	S14Q==
X-Gm-Message-State: AOPr4FWcSp+A3+hg7wQ+iFiy+FamPe/DalX/2xrHK51aZhnMpSxE08tqc7qJrFbhMjAhkWj0QRVMJP6S3dGp6g==
MIME-Version: 1.0
X-Received: by 10.60.96.74 with SMTP id dq10mr11018897oeb.48.1460737804918;
	Fri, 15 Apr 2016 09:30:04 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Fri, 15 Apr 2016 09:30:04 -0700 (PDT)
In-Reply-To: <CADNbA1rLRm702ks7401ina_Px1i1Bm2mi+Z0s1OJ3p+9FO_G=Q@mail.gmail.com>
References: <CADNbA1rLRm702ks7401ina_Px1i1Bm2mi+Z0s1OJ3p+9FO_G=Q@mail.gmail.com>
Date: Fri, 15 Apr 2016 12:30:04 -0400
Message-ID: <CADkTA4NDHMDZfMUTQi2f7fLzb=__d9foJzdUHExKc7Hy3Gn5gQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: - python packages
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
X-List-Received-Date: Fri, 15 Apr 2016 16:30:10 -0000
Content-Type: multipart/alternative; boundary=089e01177a6df8ea940530888591

--089e01177a6df8ea940530888591
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 9:06 PM, Derek Straka <derek@asterius.io> wrote:

> I noticed are a few python recipes that exist in meta-openembedded
> (python-six, python-requests, python-werkzeug, etc) and
> meta-virtualization.  Is there any reason to keep these around or can I
> remove them?  Also, is there any problem with me pulling the
> non-virtualization specific recipes over there and eventually removing them
> from meta-virtualization?
>

If you check the mailing list archives, we've had this question before ..
but I don't mind
answering it again.

We keep the pinned versions here, since they are actually tested via system
level use
cases, versus categorizing by language (i.e. meta-python, meta-perl, etc).
There are some
version restrictions from those various use cases .. so we can't push them
out to dependent
layers where the update cadence doesn't match.

Also, we can't even pick up python recipe version bumps without getting all
of meta-oe updated
.. which can be a major stability issue. So the meta-oe single repo and the
lack of system level
testing in a language layer (meta-python), means that the python recipes we
carry typically do
stay put.

So the duplicates, and non virtualization python recipes will remain here
for the foreseeable future.

Cheers,

Bruce


>
> -Derek
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e01177a6df8ea940530888591
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 14, 2016 at 9:06 PM, Derek Straka <span dir=3D"ltr">&lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I notic=
ed are a few python recipes that exist in meta-openembedded (python-six, py=
thon-requests, python-werkzeug, etc) and meta-virtualization.=C2=A0 Is ther=
e any reason to keep these around or can I remove them?=C2=A0 Also, is ther=
e any problem with me pulling the non-virtualization specific recipes over =
there and eventually removing them from meta-virtualization?</div></blockqu=
ote><div><br></div><div>If you check the mailing list archives, we&#39;ve h=
ad this question before .. but I don&#39;t mind</div><div>answering it agai=
n.</div><div><br></div><div>We keep the pinned versions here, since they ar=
e actually tested via system level use</div><div>cases, versus categorizing=
 by language (i.e. meta-python, meta-perl, etc). There are some</div><div>v=
ersion restrictions from those various use cases .. so we can&#39;t push th=
em out to dependent</div><div>layers where the update cadence doesn&#39;t m=
atch.</div><div><br></div><div>Also, we can&#39;t even pick up python recip=
e version bumps without getting all of meta-oe updated</div><div>.. which c=
an be a major stability issue. So the meta-oe single repo and the lack of s=
ystem level</div><div>testing in a language layer (meta-python), means that=
 the python recipes we carry typically do</div><div>stay put.</div><div><br=
></div><div>So the duplicates, and non virtualization python recipes will r=
emain here for the foreseeable future.</div><div><br></div><div>Cheers,</di=
v><div><br></div><div>Bruce</div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font color=3D"#888888"><=
div><br></div><div>-Derek</div></font></span></div>
<br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;</div>
</div></div>

--089e01177a6df8ea940530888591--
