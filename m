Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C49B7E00D89; Fri, 10 Jun 2016 09:04:02 -0700 (PDT)
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
	*      [209.85.218.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15685E00CE6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:04:00 -0700 (PDT)
Received: by mail-oi0-f53.google.com with SMTP id w5so39905513oib.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVcfgdgDuoQuFV3TcrW1UUh9cJu0OjiEnRERDkb0YQk=;
	b=estie+e0gypAitpvdtUSpz03u09h0i2iwmmflqzIlHS/EgprWWo1k9+oH915YTCSd+
	V8/H7Xi3WX2XbM26YAdXYFY0KS7kSl1Dr7EviD373MYd6VN5dT3/xTAXZ0qy1/F47nye
	+Jnq81fWS5YlFU0PgxPE0Ksi0r/Zjxj+kigWpyq+6cZ7OZtbknL5EDFhcRIj1GvkUXux
	pRFBYuIRaUdqlbxEBzDCE3+lMM5BvoKGxXCYONoQiQ3WYYS+tVQSptqHkPV+dzupPOBw
	KvdFuAA2+ZqQKefSoTHtDY+A/BKTaz4sHj4qrfQUDAJyI6QzF4fpm1d3aKkU8ae0D6Cc
	B6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVcfgdgDuoQuFV3TcrW1UUh9cJu0OjiEnRERDkb0YQk=;
	b=F5Ba0yoT9kWW6nadtkVlpJC8Fa3WxyLkbZT4aevMiy7MlqwHYI5PzCwiXj28GDKoWp
	x7oO61PildHBWQRELGHTcGpYTTN1IG/cCTRCBNgS3DlAwOB7Z39xnxUVecT4MhQAYUVY
	hlPBtqlvYfrQCjxccWvdAh27L/bVm4+/RgJAKxPEyp9476S2eTuGh1eksKjsshr79iqn
	/vUS+6JdRG3/wlzrb4K/Mr+Jw6d2Le4inS+WQOQQjxdc8Fe1DKP9Szbql6qz+Keck3zZ
	wRD4Nt+/eNQs9VeyGz5bIONBthFKnnWMdXKioSXzA8DCg1ejtjMcNzs4e4zHUQatqVEs
	MzOw==
X-Gm-Message-State: ALyK8tJmy4APApK/64WtJNwo248NjQNJJfTHJmFf1FhYaJqlFyoA4bNNeFpTn/1EFVVEFY2PmI+1G7B1YyCNHQ==
X-Received: by 10.202.83.211 with SMTP id h202mr1638628oib.191.1465574639926; 
	Fri, 10 Jun 2016 09:03:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Fri, 10 Jun 2016 09:03:59 -0700 (PDT)
In-Reply-To: <CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2016 12:03:59 -0400
Message-ID: <CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
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
X-List-Received-Date: Fri, 10 Jun 2016 16:04:02 -0000
Content-Type: multipart/alternative; boundary=001a113d6e8ece01200534eeafd1

--001a113d6e8ece01200534eeafd1
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 2:53 PM, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Hi Bruce,
>
> Now I see commit 77e846b14f4b1ea824b345a0e8594a776d3f45f7 that remove
> go-net and go-sqlite. This commit can be backported to krogoth?
>

It should backport.

I'm not currently working with Krogoth, but can try something with it next
week.
If anyone else does try it, and can confirm that things work, I'm happy to
do
the cherry pick.


>
> The go-cross and go-native errors it's only seen if I remove
> tmpdir and run cleansstate for go-cross and go-native.
>
> For example if I run:
>     bitbake go-cross -c cleansstate
>     rm -rf tmp
>     bitbake go-cross
>
> I get error that I post above. And if I run bitbake go-cross again errors
> doesn't appears anymore. My toolchain is aarch64.
>

We have seem some 'interesting' behaviour with go-cross in the past, but
nothing
in master. We've had some clean/state/restart changes in master for go,
they may
be what is keeping things working.

Bruce


>
> Fabio
>
> On Thu, Jun 9, 2016 at 3:39 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Thu, Jun 9, 2016 at 8:47 AM, Fabio Berton <
>> fabio.berton@ossystems.com.br> wrote:
>>
>>> Hi all!
>>>
>>> I'm getting some errors when building Docker. First, go-cross and
>>> go-native
>>> print these messages:
>>>
>>> -----------------------------------------------------------------------
>>> ERROR: go-cross-1.5.2-r0 do_populate_sysroot_setscene:
>>> '('patchelf-uninative',
>>> '--set-interpreter',
>>>
>>> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>>>
>>> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go')'
>>> failed with exit code 1 and the following output:
>>> cannot find section .rela.dyn
>>>
>>> WARNING: Logfile for failed setscene task is
>>>
>>> /home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_setscene.28109
>>> WARNING: Setscene task 458
>>>
>>> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
>>> go-cross_1.5.bb,
>>> do_populate_sysroot_setscene) failed with exit code '1' - real task will
>>> be run
>>> instead
>>> -----------------------------------------------------------------------
>>>
>>> ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene:
>>> '('patchelf-uninative',
>>> '--set-interpreter',
>>>
>>> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>>>
>>> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go')'
>>> failed with exit code 1 and the following output:
>>> cannot find section .rela.dyn
>>>
>>> WARNING: Logfile for failed setscene task is
>>>
>>> /home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populate_sysroot_setscene.29146
>>> WARNING: Setscene task 908
>>>
>>> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
>>> go-native_1.4.bb,
>>> do_populate_sysroot_setscene) failed with exit code '1' - real task will
>>> be run
>>> instead
>>>
>>
>> I've never seen these ones before.
>>
>>
>>> -----------------------------------------------------------------------
>>>
>>> And there are two Docker dependencies, go-net and go-sqlite, that cannot
>>> fetch
>>> sources.
>>>
>>> -----------------------------------------------------------------------
>>> WARNING: go-net-hg-r0 do_fetch: Failed to fetch URL hg://
>>> code.google.com/p;module=go.net, attempting MIRRORS if available
>>> ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch command failed with
>>> exit code 255, output:
>>> abort: HTTP Error 404: Not Found
>>>
>>> ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
>>> 'hg://code.google.com/p;module=go.net'. Unable to fetch URL from any
>>> source.
>>> -----------------------------------------------------------------------
>>>
>>> WARNING: go-sqlite-hg-r0 do_fetch: Failed to fetch URL hg://
>>> code.google.com/p;module=gosqlite, attempting MIRRORS if available
>>> ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch command failed
>>> with exit code 255, output:
>>> abort: HTTP Error 404: Not Found
>>>
>>> ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for
>>> URL: 'hg://code.google.com/p;module=gosqlite'. Unable to fetch URL from
>>> any source.
>>> -----------------------------------------------------------------------
>>>
>>> Can someone help me to resolve these errors? I'm using krogoth branch
>>> for oe-core, meta-oe and meta-virtualization.
>>>
>>>
>> Check what I've done in mater. I was able to drop those two dependencies,
>> sine they
>> are in the core of go-cross and not something that needs to be separately
>> fetched
>> any more.
>>
>> Over the last few months, go-net and sqlite have been bouncing around as
>> available
>> and unavailable, so I finally dropped them.
>>
>> Bruce
>>
>>
>>> Regards,
>>>
>>> Fabio
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d6e8ece01200534eeafd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 9, 2016 at 2:53 PM, Fabio Berton <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:sma=
ll">Hi Bruce,<br><br>Now I see commit 77e846b14f4b1ea824b345a0e8594a776d3f4=
5f7 that remove go-net and go-sqlite. This commit can be backported to krog=
oth?<br></div></div></blockquote><div><br></div><div>It should backport.<br=
><br></div><div>I&#39;m not currently working with Krogoth, but can try som=
ething with it next week.<br></div><div>If anyone else does try it, and can=
 confirm that things work, I&#39;m happy to do <br></div><div>the cherry pi=
ck.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div style=3D"font-family:monospace,monospace;font-size:small"><br></div=
><div style=3D"font-family:monospace,monospace;font-size:small">The go-cros=
s and go-native errors it&#39;s only seen if I remove <br>tmpdir and run cl=
eansstate for go-cross and go-native. <br><br>For example if I run:<br></di=
v><div style=3D"font-family:monospace,monospace;font-size:small">=C2=A0=C2=
=A0=C2=A0 bitbake go-cross -c cleansstate<br></div><div style=3D"font-famil=
y:monospace,monospace;font-size:small">=C2=A0=C2=A0=C2=A0 rm -rf tmp<br></d=
iv><div style=3D"font-family:monospace,monospace;font-size:small">=C2=A0=C2=
=A0=C2=A0 bitbake go-cross<br><br></div><div style=3D"font-family:monospace=
,monospace;font-size:small">I get error that I post above. And if I run bit=
bake go-cross again errors doesn&#39;t appears anymore. My toolchain is aar=
ch64.<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></div=
></div></blockquote><div><br></div><div>We have seem some &#39;interesting&=
#39; behaviour with go-cross in the past, but nothing<br></div><div>in mast=
er. We&#39;ve had some clean/state/restart changes in master for go, they m=
ay<br></div><div>be what is keeping things working.<br><br></div><div>Bruce=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div style=3D"font-family:monospace,monospace;font-size:small"><span class=
=3D"HOEnZb"><font color=3D"#888888"><br></font></span></div><span class=3D"=
HOEnZb"><font color=3D"#888888"><div style=3D"font-family:monospace,monospa=
ce;font-size:small">Fabio<br></div></font></span></div><div class=3D"HOEnZb=
"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Thu, Jun 9, 2016 at 3:39 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div=
><div>On Thu, Jun 9, 2016 at 8:47 AM, Fabio Berton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.bert=
on@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:s=
mall">Hi all!<br><br>I&#39;m getting some errors when building Docker. Firs=
t, go-cross and go-native<br>print these messages:<br><br>-----------------=
------------------------------------------------------<br>ERROR: go-cross-1=
.5.2-r0 do_populate_sysroot_setscene: &#39;(&#39;patchelf-uninative&#39;,<b=
r>&#39;--set-interpreter&#39;,<br>&#39;/home/user/src/prj/build/tmp/sysroot=
s-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;,<br>&#39;/home/user/=
src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-popula=
te_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go&#39;)&#39;<br>failed w=
ith exit code 1 and the following output:<br>cannot find section .rela.dyn<=
br><br>WARNING: Logfile for failed setscene task is<br>/home/user/src/prj/b=
uild/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_s=
etscene.28109<br>WARNING: Setscene task 458<br>(/home/user/src/prj/sources/=
meta-virtualization/recipes-devtools/go-cross/<a href=3D"http://go-cross_1.=
5.bb" target=3D"_blank">go-cross_1.5.bb</a>,<br>do_populate_sysroot_setscen=
e) failed with exit code &#39;1&#39; - real task will be run<br>instead<br>=
-----------------------------------------------------------------------<br>=
<br>ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene: &#39;(&#39;patc=
helf-uninative&#39;,<br>&#39;--set-interpreter&#39;,<br>&#39;/home/user/src=
/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39=
;,<br>&#39;/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r=
0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go&#39;)&#39;=
<br>failed with exit code 1 and the following output:<br>cannot find sectio=
n .rela.dyn<br><br>WARNING: Logfile for failed setscene task is<br>/home/us=
er/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_popul=
ate_sysroot_setscene.29146<br>WARNING: Setscene task 908<br>(/home/user/src=
/prj/sources/meta-virtualization/recipes-devtools/go-cross/<a href=3D"http:=
//go-native_1.4.bb" target=3D"_blank">go-native_1.4.bb</a>,<br>do_populate_=
sysroot_setscene) failed with exit code &#39;1&#39; - real task will be run=
<br>instead<br></div></div></blockquote><div><br></div></div></div><div>I&#=
39;ve never seen these ones before.</div><span><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:monospace,mo=
nospace;font-size:small">--------------------------------------------------=
---------------------<br><br>And there are two Docker dependencies, go-net =
and go-sqlite, that cannot fetch<br>sources.<br><br>-----------------------=
------------------------------------------------<br>WARNING: go-net-hg-r0 d=
o_fetch: Failed to fetch URL hg://<a href=3D"http://code.google.com/p;modul=
e=3Dgo.net" target=3D"_blank">code.google.com/p;module=3Dgo.net</a>, attemp=
ting MIRRORS if available<br>ERROR: go-net-hg-r0 do_fetch: Fetcher failure:=
 Fetch command failed with exit code 255, output:<br>abort: HTTP Error 404:=
 Not Found<br><br>ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher fa=
ilure for URL: &#39;hg://<a href=3D"http://code.google.com/p;module=3Dgo.ne=
t" target=3D"_blank">code.google.com/p;module=3Dgo.net</a>&#39;. Unable to =
fetch URL from any source.<br>---------------------------------------------=
--------------------------<br><br>WARNING: go-sqlite-hg-r0 do_fetch: Failed=
 to fetch URL hg://<a href=3D"http://code.google.com/p;module=3Dgosqlite" t=
arget=3D"_blank">code.google.com/p;module=3Dgosqlite</a>, attempting MIRROR=
S if available<br>ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch c=
ommand failed with exit code 255, output:<br>abort: HTTP Error 404: Not Fou=
nd<br><br>ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure=
 for URL: &#39;hg://<a href=3D"http://code.google.com/p;module=3Dgosqlite" =
target=3D"_blank">code.google.com/p;module=3Dgosqlite</a>&#39;. Unable to f=
etch URL from any source.<br>----------------------------------------------=
-------------------------<br><br>Can someone help me to resolve these error=
s? I&#39;m using krogoth branch for oe-core, meta-oe and meta-virtualizatio=
n.<br><br></div></div></blockquote><div><br></div></span><div>Check what I&=
#39;ve done in mater. I was able to drop those two dependencies, sine they<=
/div><div>are in the core of go-cross and not something that needs to be se=
parately fetched</div><div>any more.</div><div><br></div><div>Over the last=
 few months, go-net and sqlite have been bouncing around as available</div>=
<div>and unavailable, so I finally dropped them.</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div style=3D"font-family:monospace,monospace;font-size:small">Regards,<br>=
<br>Fabio<span><font color=3D"#888888"><br></font></span></div></div><span>=
<font color=3D"#888888">
<br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></font></span></blockquote></div><span><font color=3D"#888888"><br><br =
clear=3D"all"><div><br></div>-- <br><div data-smartmail=3D"gmail_signature"=
>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113d6e8ece01200534eeafd1--
