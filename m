Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C07DE0094C; Tue, 21 Feb 2017 14:50:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nitishjha16[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82929E008D0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Feb 2017 14:50:44 -0800 (PST)
Received: by mail-it0-f65.google.com with SMTP id r141so18437518ita.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Feb 2017 14:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1/b5MT9g9SyL07jazalxEghV+jSjJh6XZC3MtIWYGA=;
	b=Zv8g+GUDnSkO+Oa4WUYsuZaAzPvue9OcU+T5OSs0Pc6fjwfexfNDfrjkXWd+V523+D
	Jdx5suevTUiSVjhVthPB3B1iS7Na2/BAdTrc3rrCz6JMmQcEJouFC1mFkt9zbOBSj3Ai
	pkNtcvkfU1BRTIx19z9mJTJv1v2frHqBx4TIsem9qD4p8WpUuF0gvdtFB+KgeoQeo/aw
	LPpEc6Y0YxnwX6EUQKD2CVPONYfvsH7hE+1wACU9bqye6O1MgufZno20D0TBKaHVUd6b
	YfjYK39QyCVgIZibuGYKoR3Y0MKp4ty2gvxhViwq8sfzSJwi2/Xykrz2rw8GLOVjs7sH
	EYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1/b5MT9g9SyL07jazalxEghV+jSjJh6XZC3MtIWYGA=;
	b=NI12pkF3HYybrq+ZP7H3FnRCTn9ow5VCJ57MxupyWOCYJxwrBJoFaFgeqH4tfgMduD
	3E4R83TDG1mbbi91+gKWG04kmPTpi3DthcH+upEVGY9liXwrl29rcnuMTckPpmxbBSBQ
	HoxAubmIG5V+LgkibFGp+DkeGL3tZi+Jz5nuIfUQZJ04pWpvC3jpAMPsmZW76MPq9fYO
	9bsrXVkfzsEDFhLC5Nb+eeGt3r9OYDraFPnIJx6FZ1FLpfRppBceIffjC6cDKJ4FecdM
	klQdRpzI4YxtgpaJx1AByK+PnVNV1AeTNc+a+ZpX21h3TIkpvbsR8qJeMG/szOFcfeul
	TmNQ==
X-Gm-Message-State: AMke39l2E+9i6nRnaSJ8/KI4uYlPlw9GUVc9YT4B+Zk3zTEUOFOAZZTLUr96fCG8ihxn2H0L31t8IoF0qPsdrg==
X-Received: by 10.36.104.15 with SMTP id v15mr28788106itb.104.1487717443467;
	Tue, 21 Feb 2017 14:50:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.142.205 with HTTP; Tue, 21 Feb 2017 14:50:43 -0800 (PST)
In-Reply-To: <a88bb8cc-1232-6493-fbd2-7020cc373df9@cardoe.com>
References: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
	<a88bb8cc-1232-6493-fbd2-7020cc373df9@cardoe.com>
From: nitish jha <nitishjha16@gmail.com>
Date: Tue, 21 Feb 2017 23:50:43 +0100
Message-ID: <CABh+foapVgHwE40xENUqCegSsJ_Bqep-p+TQwV8rhDnF00bT1g@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Error Building xen-image-minimal
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
X-List-Received-Date: Tue, 21 Feb 2017 22:50:45 -0000
Content-Type: multipart/alternative; boundary=001a113f6848be8e61054912351c

--001a113f6848be8e61054912351c
Content-Type: text/plain; charset=UTF-8

Hello Doug

I again tried compiling morty, meta-openmebedded and meta-vertualization

And I am facing same Issue for glibc-locale-2.24-r0

command I am using to down load package is

git clone -b morty https://git.yoctoproject.org/git/poky

git clone -b morty https://github.com/openembedded/meta-openembedded.git

git clone -b morty https://git.yoctoproject.org/git/meta-virtualization

my bblayers.conf looks like

BBLAYERS ?= " \
  /home/njking/yocto/poky/meta \
  /home/njking/yocto/poky/meta-yocto \
  /home/njking/yocto/poky/meta-yocto-bsp \
  "


BBLAYERS_NON_REMOVABLE ?= " \
  /home/njking/yocto/poky/meta \
  /home/njking/yocto/poky/meta-yocto \
  "

BBLAYERS += "/home/njking/yocto/meta-virtualization"
BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-oe"
BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-networking"
BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-python"
BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-filesystems"


and I have added following lines to the local.conf

EXTRA_IMAGE_FEATURES += "ssh-server-openssh"
MACHINE ?= "qemux86-64"
DISTRO_FEATURES += "xen"


It would be great help if you could tel me which poky, meta-openembedded
and meta-virtualization version i should checkout so that i could build my
xen-image-minmal successfully.

Thanks and Regards

Nitish




On Sun, Feb 12, 2017 at 11:28 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 2/11/17 9:57 AM, nitish jha wrote:
> > Hello All,
> >
> > I am tryin to build xen-image-minimal
> >
> > but I am getting following error
> >
> > ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:
> > Files/directories were installed but not shipped in any package:
>
> <snip>
>
> > Please set FILES such that these items are packaged. Alternatively if
> > they are unneeded, avoid installing them or delete them within
> do_install.
> > glibc-locale: 820 installed and not shipped files. [installed-vs-shipped]
> > ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing
> task.
> > ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
> > ERROR: Logfile of failure stored in:
> > /home/njking/yocto_morty/build_xen_qemu/tmp/work/core2-
> 64-poky-linux/glibc-locale/2.24-r0/temp/log.do_package.17564
> > ERROR: Task
> > (/home/njking/yocto_morty/poky/meta/recipes-core/glibc/
> glibc-locale_2.24.bb:do_package)
> > failed with exit code '1'
> >
>
> Unfortunately this issue is with the glibc package. Which does not live
> in meta-virtualization. I'm at a loss why you would see that since I
> build morty fairly regularly and haven't seen this. I would make sure
> you are on the latest versions.
>
> --
> Doug Goldstein
>
>


--

--001a113f6848be8e61054912351c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Doug<div><br></div><div>I again tried compiling mort=
y, meta-openmebedded and meta-vertualization</div><div><br></div><div>And I=
 am facing same Issue for glibc-locale-2.24-r0</div><div><br></div><div>com=
mand I am using to down load package is=C2=A0</div><div><br></div><div>git =
clone -b morty <a href=3D"https://git.yoctoproject.org/git/poky">https://gi=
t.yoctoproject.org/git/poky</a><br></div><div><br></div><div>git clone -b m=
orty <a href=3D"https://github.com/openembedded/meta-openembedded.git">http=
s://github.com/openembedded/meta-openembedded.git</a><br></div><div><br></d=
iv><div>git clone -b morty <a href=3D"https://git.yoctoproject.org/git/meta=
-virtualization">https://git.yoctoproject.org/git/meta-virtualization</a><b=
r></div><div><br></div><div>my bblayers.conf looks like</div><div><br></div=
><div><div>BBLAYERS ?=3D &quot; \</div><div>=C2=A0 /home/njking/yocto/poky/=
meta \</div><div>=C2=A0 /home/njking/yocto/poky/meta-yocto \</div><div>=C2=
=A0 /home/njking/yocto/poky/meta-yocto-bsp \</div><div>=C2=A0 &quot;</div><=
div><br></div><div><br></div><div>BBLAYERS_NON_REMOVABLE ?=3D &quot; \</div=
><div>=C2=A0 /home/njking/yocto/poky/meta \</div><div>=C2=A0 /home/njking/y=
octo/poky/meta-yocto \</div><div>=C2=A0 &quot;</div><div><br></div><div>BBL=
AYERS +=3D &quot;/home/njking/yocto/meta-virtualization&quot;</div><div>BBL=
AYERS +=3D &quot;/home/njking/yocto/meta-openembedded/meta-oe&quot;</div><d=
iv>BBLAYERS +=3D &quot;/home/njking/yocto/meta-openembedded/meta-networking=
&quot;</div><div>BBLAYERS +=3D &quot;/home/njking/yocto/meta-openembedded/m=
eta-python&quot;</div><div>BBLAYERS +=3D &quot;/home/njking/yocto/meta-open=
embedded/meta-filesystems&quot;</div></div><div><br></div><div><br></div><d=
iv>and I have added following lines to the local.conf</div><div><br></div><=
div><div>EXTRA_IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;</div><div=
>MACHINE ?=3D &quot;qemux86-64&quot;</div><div>DISTRO_FEATURES +=3D &quot;x=
en&quot;</div></div><div><br></div><div><br></div><div>It would be great he=
lp if you could tel me which poky, meta-openembedded and meta-virtualizatio=
n version i should checkout so that i could build my xen-image-minmal succe=
ssfully.</div><div><br></div><div>Thanks and Regards</div><div><br></div><d=
iv>Nitish =C2=A0</div><div><br></div><div><br></div><div><br></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Feb 12, 2017 at 1=
1:28 PM, Doug Goldstein <span dir=3D"ltr">&lt;<a href=3D"mailto:cardoe@card=
oe.com" target=3D"_blank">cardoe@cardoe.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 2/11/=
17 9:57 AM, nitish jha wrote:<br>
&gt; Hello All,<br>
&gt;<br>
&gt; I am tryin to build xen-image-minimal<br>
&gt;<br>
&gt; but I am getting following error<br>
&gt;<br>
&gt; ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:<br>
&gt; Files/directories were installed but not shipped in any package:<br>
<br>
</span>&lt;snip&gt;<br>
<span class=3D"gmail-"><br>
&gt; Please set FILES such that these items are packaged. Alternatively if<=
br>
&gt; they are unneeded, avoid installing them or delete them within do_inst=
all.<br>
&gt; glibc-locale: 820 installed and not shipped files. [installed-vs-shipp=
ed]<br>
&gt; ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing=
 task.<br>
&gt; ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package<br=
>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/njking/yocto_morty/<wbr>build_xen_qemu/tmp/work/core2-<wbr>64-po=
ky-linux/glibc-locale/2.<wbr>24-r0/temp/log.do_package.<wbr>17564<br>
&gt; ERROR: Task<br>
&gt; (/home/njking/yocto_morty/<wbr>poky/meta/recipes-core/glibc/<wbr>glibc=
-locale_2.24.bb:do_<wbr>package)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt;<br>
<br>
</span>Unfortunately this issue is with the glibc package. Which does not l=
ive<br>
in meta-virtualization. I&#39;m at a loss why you would see that since I<br=
>
build morty fairly regularly and haven&#39;t seen this. I would make sure<b=
r>
you are on the latest versions.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>--=20
</div></div>

--001a113f6848be8e61054912351c--
