Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F019CE00D54; Thu,  9 Jun 2016 11:54:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED133E00CB5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Jun 2016 11:54:03 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id u74so4268608lff.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Jun 2016 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q5wSY8ZgXfOzWLPghllB+MfMaEWrqQtXUPZX3EbQT6c=;
	b=ztf4BKAx9uBIWeRDjdhi6gn5LZHnE3CZgFkw7FkriCrpJryycK/KMiw+E/NpxH6UgG
	+FCAtvdp50JlPY9VIg6w2R5fznPQSzdSnJHNqpFhI25aQlRinnoCdzd5JTbEtcdidFv/
	1C+FkEplvAPxWHBA9ivFIx/AMf6nsrQIA/MFDS54MQMJSCjtt68g+jxv2hMJpwmzDsk0
	IGgAvdmOtjFbGFyq1pIeie8Xp+7fi+GjKoPJ+egAWQ66zJ5aGC8BJS3z1UNpKphpuDTY
	5L9YDjz1g8ljLQ1+vL9oqEuYlpDk4FKatRkQlrKBwoH/QQkKmfU3SLENP16Nk+NOYT/9
	xl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q5wSY8ZgXfOzWLPghllB+MfMaEWrqQtXUPZX3EbQT6c=;
	b=hBjq6Tw3HaRDv/i8JEVufuTh2aNDd5I86PQOI1mF3BKbkyE7Xesklsqk+QGif9CkDP
	QExr0Q9v0/KFJYVpRT/ckPidh+32FeHvCaMw4m1DCFtGkzvlNYtot/pCRXaLCzYTlDGH
	C+cn2syp5v/5qY4SRUIeFBmRihhSjW8V4XOT6VG/iYuoJIDZNoi/CGzjsJcPhZcjoOjt
	I8nMsWANBkfjtRAEuKN4ZUgDs6Kcw/tnyrfe8POYyzGn/kG6F0z1+c1IsFvrLwNdo6a9
	aeUi4mOOOfcf3hKBZ7ktH857sSroo0XgJ+Ejbwur65TJ+bQ1P08lnYvFQ3uexmCbntEt
	09mg==
X-Gm-Message-State: ALyK8tJLadxRsqtBAWCd+Cg0xCx7yt6isAiNZp2o+D4f3zMRWziptdIIU+xw97O6aqBRgryHX92lENBdv4WggA==
X-Received: by 10.25.79.14 with SMTP id d14mr6928741lfb.112.1465498441624;
	Thu, 09 Jun 2016 11:54:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Thu, 9 Jun 2016 11:53:32 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 9 Jun 2016 15:53:32 -0300
Message-ID: <CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [krogoth] Golang errors when building Docker
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
X-List-Received-Date: Thu, 09 Jun 2016 18:54:06 -0000
Content-Type: multipart/alternative; boundary=001a1141ef5a0847e30534dcf298

--001a1141ef5a0847e30534dcf298
Content-Type: text/plain; charset=UTF-8

Hi Bruce,

Now I see commit 77e846b14f4b1ea824b345a0e8594a776d3f45f7 that remove
go-net and go-sqlite. This commit can be backported to krogoth?

The go-cross and go-native errors it's only seen if I remove
tmpdir and run cleansstate for go-cross and go-native.

For example if I run:
    bitbake go-cross -c cleansstate
    rm -rf tmp
    bitbake go-cross

I get error that I post above. And if I run bitbake go-cross again errors
doesn't appears anymore. My toolchain is aarch64.

Fabio

On Thu, Jun 9, 2016 at 3:39 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Thu, Jun 9, 2016 at 8:47 AM, Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
>
>> Hi all!
>>
>> I'm getting some errors when building Docker. First, go-cross and
>> go-native
>> print these messages:
>>
>> -----------------------------------------------------------------------
>> ERROR: go-cross-1.5.2-r0 do_populate_sysroot_setscene:
>> '('patchelf-uninative',
>> '--set-interpreter',
>>
>> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>>
>> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go')'
>> failed with exit code 1 and the following output:
>> cannot find section .rela.dyn
>>
>> WARNING: Logfile for failed setscene task is
>>
>> /home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_setscene.28109
>> WARNING: Setscene task 458
>> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
>> go-cross_1.5.bb,
>> do_populate_sysroot_setscene) failed with exit code '1' - real task will
>> be run
>> instead
>> -----------------------------------------------------------------------
>>
>> ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene:
>> '('patchelf-uninative',
>> '--set-interpreter',
>>
>> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>>
>> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go')'
>> failed with exit code 1 and the following output:
>> cannot find section .rela.dyn
>>
>> WARNING: Logfile for failed setscene task is
>>
>> /home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populate_sysroot_setscene.29146
>> WARNING: Setscene task 908
>> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
>> go-native_1.4.bb,
>> do_populate_sysroot_setscene) failed with exit code '1' - real task will
>> be run
>> instead
>>
>
> I've never seen these ones before.
>
>
>> -----------------------------------------------------------------------
>>
>> And there are two Docker dependencies, go-net and go-sqlite, that cannot
>> fetch
>> sources.
>>
>> -----------------------------------------------------------------------
>> WARNING: go-net-hg-r0 do_fetch: Failed to fetch URL hg://
>> code.google.com/p;module=go.net, attempting MIRRORS if available
>> ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch command failed with
>> exit code 255, output:
>> abort: HTTP Error 404: Not Found
>>
>> ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
>> 'hg://code.google.com/p;module=go.net'. Unable to fetch URL from any
>> source.
>> -----------------------------------------------------------------------
>>
>> WARNING: go-sqlite-hg-r0 do_fetch: Failed to fetch URL hg://
>> code.google.com/p;module=gosqlite, attempting MIRRORS if available
>> ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch command failed
>> with exit code 255, output:
>> abort: HTTP Error 404: Not Found
>>
>> ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for
>> URL: 'hg://code.google.com/p;module=gosqlite'. Unable to fetch URL from
>> any source.
>> -----------------------------------------------------------------------
>>
>> Can someone help me to resolve these errors? I'm using krogoth branch for
>> oe-core, meta-oe and meta-virtualization.
>>
>>
> Check what I've done in mater. I was able to drop those two dependencies,
> sine they
> are in the core of go-cross and not something that needs to be separately
> fetched
> any more.
>
> Over the last few months, go-net and sqlite have been bouncing around as
> available
> and unavailable, so I finally dropped them.
>
> Bruce
>
>
>> Regards,
>>
>> Fabio
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a1141ef5a0847e30534dcf298
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Bruce,<br><br>Now I see commit 77e846b14f4b=
1ea824b345a0e8594a776d3f45f7 that remove go-net and go-sqlite. This commit =
can be backported to krogoth?<br><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace,monospace;font-size:small">The go-cross and go-=
native errors it&#39;s only seen if I remove <br>tmpdir and run cleansstate=
 for go-cross and go-native. <br><br>For example if I run:<br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sm=
all">=C2=A0=C2=A0=C2=A0 bitbake go-cross -c cleansstate<br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">=C2=A0=C2=A0=C2=A0 rm -rf tmp<br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">=C2=A0=C2=A0=C2=A0 bit=
bake go-cross<br><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace,monospace;font-size:small">I get error that I post above. And i=
f I run bitbake go-cross again errors doesn&#39;t appears anymore. My toolc=
hain is aarch64.<br><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:monospace,monospace;font-size:small">Fabio<br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 9, 2016 at 3:39=
 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@=
gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote"><div><div class=3D"h5">On Thu, Jun 9=
, 2016 at 8:47 AM, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mailto:fab=
io.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div style=3D"font-family:monospace,monospace;font-size:small">Hi all!<br><b=
r>I&#39;m getting some errors when building Docker. First, go-cross and go-=
native<br>print these messages:<br><br>------------------------------------=
-----------------------------------<br>ERROR: go-cross-1.5.2-r0 do_populate=
_sysroot_setscene: &#39;(&#39;patchelf-uninative&#39;,<br>&#39;--set-interp=
reter&#39;,<br>&#39;/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-=
linux/lib/ld-linux-x86-64.so.2&#39;,<br>&#39;/home/user/src/prj/build/tmp/w=
ork/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate_sysroot/x86_64-l=
inux/usr/bin/aarch64-prj-linux/go&#39;)&#39;<br>failed with exit code 1 and=
 the following output:<br>cannot find section .rela.dyn<br><br>WARNING: Log=
file for failed setscene task is<br>/home/user/src/prj/build/tmp/work/x86_6=
4-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_setscene.28109<br>WA=
RNING: Setscene task 458<br>(/home/user/src/prj/sources/meta-virtualization=
/recipes-devtools/go-cross/<a href=3D"http://go-cross_1.5.bb" target=3D"_bl=
ank">go-cross_1.5.bb</a>,<br>do_populate_sysroot_setscene) failed with exit=
 code &#39;1&#39; - real task will be run<br>instead<br>-------------------=
----------------------------------------------------<br><br>ERROR: go-nativ=
e-1.4.3-r0 do_populate_sysroot_setscene: &#39;(&#39;patchelf-uninative&#39;=
,<br>&#39;--set-interpreter&#39;,<br>&#39;/home/user/src/prj/build/tmp/sysr=
oots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;,<br>&#39;/home/us=
er/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/sstate-install-po=
pulate_sysroot/x86_64-linux/usr/lib/go/bin/go&#39;)&#39;<br>failed with exi=
t code 1 and the following output:<br>cannot find section .rela.dyn<br><br>=
WARNING: Logfile for failed setscene task is<br>/home/user/src/prj/build/tm=
p/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populate_sysroot_setscen=
e.29146<br>WARNING: Setscene task 908<br>(/home/user/src/prj/sources/meta-v=
irtualization/recipes-devtools/go-cross/<a href=3D"http://go-native_1.4.bb"=
 target=3D"_blank">go-native_1.4.bb</a>,<br>do_populate_sysroot_setscene) f=
ailed with exit code &#39;1&#39; - real task will be run<br>instead<br></di=
v></div></blockquote><div><br></div></div></div><div>I&#39;ve never seen th=
ese ones before.</div><span class=3D""><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:monospace,monospac=
e;font-size:small">--------------------------------------------------------=
---------------<br><br>And there are two Docker dependencies, go-net and go=
-sqlite, that cannot fetch<br>sources.<br><br>-----------------------------=
------------------------------------------<br>WARNING: go-net-hg-r0 do_fetc=
h: Failed to fetch URL hg://<a href=3D"http://code.google.com/p;module=3Dgo=
.net" target=3D"_blank">code.google.com/p;module=3Dgo.net</a>, attempting M=
IRRORS if available<br>ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch=
 command failed with exit code 255, output:<br>abort: HTTP Error 404: Not F=
ound<br><br>ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure =
for URL: &#39;hg://<a href=3D"http://code.google.com/p;module=3Dgo.net" tar=
get=3D"_blank">code.google.com/p;module=3Dgo.net</a>&#39;. Unable to fetch =
URL from any source.<br>---------------------------------------------------=
--------------------<br><br>WARNING: go-sqlite-hg-r0 do_fetch: Failed to fe=
tch URL hg://<a href=3D"http://code.google.com/p;module=3Dgosqlite" target=
=3D"_blank">code.google.com/p;module=3Dgosqlite</a>, attempting MIRRORS if =
available<br>ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch comman=
d failed with exit code 255, output:<br>abort: HTTP Error 404: Not Found<br=
><br>ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for =
URL: &#39;hg://<a href=3D"http://code.google.com/p;module=3Dgosqlite" targe=
t=3D"_blank">code.google.com/p;module=3Dgosqlite</a>&#39;. Unable to fetch =
URL from any source.<br>---------------------------------------------------=
--------------------<br><br>Can someone help me to resolve these errors? I&=
#39;m using krogoth branch for oe-core, meta-oe and meta-virtualization.<br=
><br></div></div></blockquote><div><br></div></span><div>Check what I&#39;v=
e done in mater. I was able to drop those two dependencies, sine they</div>=
<div>are in the core of go-cross and not something that needs to be separat=
ely fetched</div><div>any more.</div><div><br></div><div>Over the last few =
months, go-net and sqlite have been bouncing around as available</div><div>=
and unavailable, so I finally dropped them.</div><div><br></div><div>Bruce<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
style=3D"font-family:monospace,monospace;font-size:small">Regards,<br><br>F=
abio<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></div>=
</div><span class=3D"HOEnZb"><font color=3D"#888888">
<br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"=
#888888"><br><br clear=3D"all"><div><br></div>-- <br><div data-smartmail=3D=
"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos a=
nd madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br></div>

--001a1141ef5a0847e30534dcf298--
