Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E55AE01765
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2013 22:59:49 -0700 (PDT)
Received: by mail-ea0-f180.google.com with SMTP id l9so236525eaj.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2013 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SVZAsWQ7PSo1exNlLHCOSv/VTfaWk2YtrQA3iU4aUZE=;
	b=rC11FRtCXrAepWos5kOltxiEnAcswTmsLRn/JYHNSF4gIRWw2LTv09LIjpkDBzcpCk
	Fel86GXeeg3hloXLtnCgtoSrR4gdxNcF5LnlG3ipWnN2DihWYBhBX1Ev88L155GIv9tD
	rDALCWu9BeuqzhMAOHXhSOyLvSLf6/kVgO7ok2RQXNnkgddi7OxdDDIbFu08/mEhV0Od
	M2/b77jcGV2r7C3G/OQnWK8cygzBTq3US+AD+xDY7P2Bsj+itRPQw2GCjJZX+bmzggUV
	KWtJZOtwrRgD3gmjUk1uelyhWQexVcqlgW3iwBba2V8Y5/sxF7PlsQiDMZuI/yj1jajr
	s7Hw==
MIME-Version: 1.0
X-Received: by 10.14.95.69 with SMTP id o45mr1520265eef.107.1382680788751;
	Thu, 24 Oct 2013 22:59:48 -0700 (PDT)
Received: by 10.14.206.133 with HTTP; Thu, 24 Oct 2013 22:59:48 -0700 (PDT)
Received: by 10.14.206.133 with HTTP; Thu, 24 Oct 2013 22:59:48 -0700 (PDT)
In-Reply-To: <CADkTA4PhJRBOV-vjye2eo6Oo8Kz1MYpTcwV8OSshfG4=8rD1Nw@mail.gmail.com>
References: <526979F3.3060707@enea.com>
	<CADkTA4PhJRBOV-vjye2eo6Oo8Kz1MYpTcwV8OSshfG4=8rD1Nw@mail.gmail.com>
Date: Fri, 25 Oct 2013 06:59:48 +0100
Message-ID: <CAAKB1h1yvrgqWHZpKR9EM+XsuemL3A6zN1ydd1xxzrc6FSgUrA@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Release branches.
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
X-List-Received-Date: Fri, 25 Oct 2013 05:59:50 -0000
Content-Type: multipart/alternative; boundary=001a11c3f60c4057cf04e98a75f4

--001a11c3f60c4057cf04e98a75f4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 25 Oct 2013 00:06, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Oct 24, 2013 at 3:50 PM, David Nystr=F6m <david.nystrom@enea.com>
wrote:
> > Hi,
> >
> > Should we start doing release branches in meta-virtualzation ?
> > Perhaps its time.
> >
> > What do you think ?
>
> It is definitely time. I have a few that I maintain locally, and it is
> little effort for us
> to create matching branches to the yocto/oe-core release that is last
known to
> work.
>
> I can start by pushing out a few branches that match the tags that I
> have locally
> if that's ok ?

Thats OK. Thanks Bruce.

Br,
David
>
> Bruce
> >
> > Br,
> > David
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

--001a11c3f60c4057cf04e98a75f4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 25 Oct 2013 00:06, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Oct 24, 2013 at 3:50 PM, David Nystr=F6m &lt;<a href=3D"mailto=
:david.nystrom@enea.com">david.nystrom@enea.com</a>&gt; wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Should we start doing release branches in meta-virtualzation ?<br=
>
&gt; &gt; Perhaps its time.<br>
&gt; &gt;<br>
&gt; &gt; What do you think ?<br>
&gt;<br>
&gt; It is definitely time. I have a few that I maintain locally, and it is=
<br>
&gt; little effort for us<br>
&gt; to create matching branches to the yocto/oe-core release that is last =
known to<br>
&gt; work.<br>
&gt;<br>
&gt; I can start by pushing out a few branches that match the tags that I<b=
r>
&gt; have locally<br>
&gt; if that&#39;s ok ?</p>
<p dir=3D"ltr">Thats OK. Thanks Bruce.</p>
<p dir=3D"ltr">Br,<br>
David<br>
&gt;<br>
&gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt; Br,<br>
&gt; &gt; David<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-virtualization mailing list<br>
&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virt=
ualization@yoctoproject.org</a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiz=
ation">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
</p>

--001a11c3f60c4057cf04e98a75f4--
