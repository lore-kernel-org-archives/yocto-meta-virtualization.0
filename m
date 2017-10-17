Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4B00E00C01; Tue, 17 Oct 2017 11:17:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 002B3E00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 11:17:01 -0700 (PDT)
Received: by mail-wm0-f47.google.com with SMTP id i124so5520328wmf.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 11:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WjY7cKfszC8RL7VxkaVljKYHLHjkpsGRD0qoq/2y/cM=;
	b=KYRvcbRXLHdwvwK0rcAzPBduQzOwCYkzgVgaicB7uRKlmzcAbIVY2lj1FXT7AYxuFJ
	xBhP0B1RlSg6ckpoambpAMYrkJu/ztOwW1QiDBG5z1FaqjtGNeE3eI4qhZ+SrPgVE2kA
	wjSRlXZXbV5SDLyfX6i/k6XXTI/808MU0QCw0dkt7uJTZ5sSsF4EkxEt2SK6TpGfYYja
	VyQoVWFTJh60Lr0y6zvpjlm2tCTbSL9KRIwAiPmfTYJ4WVngUmmlt1qamkOV7aSXnh0Z
	iTVzUZYZ7ASyITMHBDbPOuWON1HA7l+4juObdoP4W0embJSbQQJZpP9n7pn/FzeFC5Ph
	H35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WjY7cKfszC8RL7VxkaVljKYHLHjkpsGRD0qoq/2y/cM=;
	b=CmRzQfb9Vx6hBVlsPGxpkhJXLSKydPrF45pS/9I5ynmtwH27iSSCRrhveO33rQ9cgJ
	8c8CF76y+5V5pV+rswJi+LDwCgF4d+I4JocRjVxpRW94QWG0DCUdHgXaPujqItBOWAmt
	+Zbt+n3U9DpbeQi0mW/P0tGq00NsRGVnd8K6SenPdAIYfQH1mZYekQFaC1Fhx6ewPBfq
	4rqrMJG+vue2uV2vi7IhxtVtukaFPmloP0L3N3+PFoDzBQS7ve0NrKJVVvIprDsFKK1y
	46rFRlzagrcQ0WOMva9GWGiY0VNx3R9oDKp7kOQ065KwGDRknJ6ep1sCqObJ+7VMolb0
	H+/w==
X-Gm-Message-State: AMCzsaUqOlpl05r3y3MIpTyXU1ORDOPZ9lgplQzgdMldHy98Lm6eiMOe
	uj6nrDsEi4XooHRTOb90yFSmaWIIJlHTTrTQV2w=
X-Google-Smtp-Source: AOwi7QDhVoQzlFBIRjoS7/snho85ySKwSymnFCE0CH7GXusxwCnpw+Jp13KDhNlxuce52xKDybW2XCA4iMkihu9/0/w=
X-Received: by 10.80.137.154 with SMTP id g26mr18173418edg.80.1508264220737;
	Tue, 17 Oct 2017 11:17:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.137.56 with HTTP; Tue, 17 Oct 2017 11:17:00 -0700 (PDT)
In-Reply-To: <CADkTA4NPWR1Yjnt-2mx=FxRRBj3O5U71tETOtATPiqH4VP8RNw@mail.gmail.com>
References: <1508256804-4341-1-git-send-email-dariusz.pelowski@gmail.com>
	<CADkTA4NPWR1Yjnt-2mx=FxRRBj3O5U71tETOtATPiqH4VP8RNw@mail.gmail.com>
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Date: Tue, 17 Oct 2017 20:17:00 +0200
Message-ID: <CAJ73Ay6Bi=gd1i=yLi57QHVh0Coq+__O7VPtL-oSerzp9Dd=bw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] vgabios: don't override the compiler ldflags
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
X-List-Received-Date: Tue, 17 Oct 2017 18:17:02 -0000
Content-Type: multipart/alternative; boundary="f403045c26da1ac604055bc221e5"

--f403045c26da1ac604055bc221e5
Content-Type: text/plain; charset="UTF-8"

Hi,

When building biossums on genericx86-64 machine, I'm getting QA issue:
ERROR: biossums-0.7a-r0 do_package_qa: QA Issue: No GNU_HASH in the elf
binary:
'/home/darekp/yocto_builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/packages-split/biossums/usr/bin/biossums'
[ldflags]
ERROR: biossums-0.7a-r0 do_package_qa: QA run found fatal errors. Please
consider fixing them.
ERROR: biossums-0.7a-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/home/darekp/yocto_builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/temp/log.do_package_qa.19574
ERROR: Task
(/home/darekp/yocto_builds/meta-virtualization/recipes-extended/vgabios/biossums_0.7a.bb:do_package_qa)
failed with exit code '1'

It's caused by overriding LDFLAGS variable to empty value in project's
makefile. In consequence there's missing LDFLAGS settings from bitbake
(including -Wl,--hash-style=gnu, which causes showing this QA).

This patch takes into the use LDFLAGS provided by bitbake.

Is it okay for you? What do you think about replacing sed invocations with
patch?

Dariusz


2017-10-17 19:12 GMT+02:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

> This needs a long log.
>
> What issue are you fixing ? What arches is that issue showing up on, etc.
>
> Bruce
>
> On Tue, Oct 17, 2017 at 12:13 PM, Dariusz Pelowski
> <dariusz.pelowski@gmail.com> wrote:
> > ---
> >  recipes-extended/vgabios/biossums_0.7a.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/recipes-extended/vgabios/biossums_0.7a.bb
> b/recipes-extended/vgabios/biossums_0.7a.bb
> > index 10bd014..e66bade 100644
> > --- a/recipes-extended/vgabios/biossums_0.7a.bb
> > +++ b/recipes-extended/vgabios/biossums_0.7a.bb
> > @@ -20,6 +20,7 @@ do_configure() {
> >      # Don't override the compiler or its flags:
> >      sed 's,^CC,DISABLED_CC,' -i Makefile
> >      sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
> > +    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
> >      # Supply the C flags to the compiler:
> >      sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
> >  }
> > --
> > 2.7.4
> >
> > --
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
>

--f403045c26da1ac604055bc221e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>When building biossums o=
n genericx86-64 machine, I&#39;m getting QA issue:</div><div>ERROR: biossum=
s-0.7a-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: &#39;/hom=
e/darekp/yocto_builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/package=
s-split/biossums/usr/bin/biossums&#39; [ldflags]</div><div>ERROR: biossums-=
0.7a-r0 do_package_qa: QA run found fatal errors. Please consider fixing th=
em.</div><div>ERROR: biossums-0.7a-r0 do_package_qa: Function failed: do_pa=
ckage_qa</div><div>ERROR: Logfile of failure stored in: /home/darekp/yocto_=
builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/temp/log.do_package_qa=
.19574</div><div>ERROR: Task (/home/darekp/yocto_builds/meta-virtualization=
/recipes-extended/vgabios/biossums_0.7a.bb:do_package_qa) failed with exit =
code &#39;1&#39;</div><div><br></div><div>It&#39;s caused by overriding LDF=
LAGS variable to empty value in project&#39;s makefile. In consequence ther=
e&#39;s missing LDFLAGS settings from bitbake (including -Wl,--hash-style=
=3Dgnu, which causes showing this QA).</div><div><br></div><div>This patch =
takes into the use LDFLAGS provided by bitbake.</div><div><br></div><div>Is=
 it okay for you? What do you think about=C2=A0replacing sed invocations wi=
th patch?</div><div><br></div><div>Dariusz</div><div><br></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-10-17 19:12 GMT+02=
:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span>:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This needs a long log.<br>
<br>
What issue are you fixing ? What arches is that issue showing up on, etc.<b=
r>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Tue, Oct 17, 2017 at 12:13 PM, Dariusz Pelowski<br>
&lt;<a href=3D"mailto:dariusz.pelowski@gmail.com">dariusz.pelowski@gmail.co=
m</a>&gt; wrote:<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=
=3D"noreferrer" target=3D"_blank">bioss<wbr>ums_0.7a.bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.=
bb" rel=3D"noreferrer" target=3D"_blank">bio<wbr>ssums_0.7a.bb</a> b/recipe=
s-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"noreferrer" t=
arget=3D"_blank">bio<wbr>ssums_0.7a.bb</a><br>
&gt; index 10bd014..e66bade 100644<br>
&gt; --- a/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=
=3D"noreferrer" target=3D"_blank">bio<wbr>ssums_0.7a.bb</a><br>
&gt; +++ b/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=
=3D"noreferrer" target=3D"_blank">bio<wbr>ssums_0.7a.bb</a><br>
&gt; @@ -20,6 +20,7 @@ do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Don&#39;t override the compiler or its flags:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 sed &#39;s,^CC,DISABLED_CC,&#39; -i Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed &#39;s,^CFLAGS,DISABLED_CFLAGS,&#39; -i Makefi=
le<br>
&gt; +=C2=A0 =C2=A0 sed &#39;s,^LDFLAGS,DISABLED_LDFLAGS,&#39; -i Makefile<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Supply the C flags to the compiler:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed &#39;s,-o biossums,$(CFLAGS) -o biossums,&#39;=
 -i Makefile<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--f403045c26da1ac604055bc221e5--
