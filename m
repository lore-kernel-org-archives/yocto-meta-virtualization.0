Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48905E00D54; Thu,  9 Jun 2016 11:39:06 -0700 (PDT)
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
	*      [209.85.218.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC44DE00CB5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Jun 2016 11:39:03 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id p204so77288642oih.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Jun 2016 11:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fi8LpnBTcmxYFPD28Y4nlF2Tb4mml2bxD9FrSxbgDSM=;
	b=b4XcEi85vSUMPBDmlAUh8yxUkKJ9hujse8LbxcJ+cHzzDjgzPu1kblWP6xj/vjeUR1
	ogLKJ95WfeXRdj3DaK5elIf4DAqW0mffcQktXGvWyGJSg+ERFztp5PIuIfrvOWl129lR
	HSfV+kWRLMOSwE+RmHOkRkoq7Dgg28/17e6FWRNIQ37Xt2pZVQVtGuwlgpYNXdNktoZ6
	iq/IeuK0Xp/RRcNooKo2f3WRoy8l6+pQV5Ue+dbwPxniaO+pBkhDxQPsrG4ky06D7Kh/
	m+fkPW0YHT92YOoE359cpIYo2NMyDRuWKZAigUS/WF+SFzUfdJJxARKu1cfFRGBtVjcr
	MvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fi8LpnBTcmxYFPD28Y4nlF2Tb4mml2bxD9FrSxbgDSM=;
	b=dd0dfbZrGIh7dP5pycUR8N60DbWKs5D3t7pOAj9I8a1Fe4m/W6BHlwWdaNFax7uzQC
	kQ40O437ZiiQglmUNL+XboUaXCH70xoZf+WuwwHbc35tZxRZlmuWsAoQtW4y1Va7S+Yx
	C0/cHJfgwScHynUeOXku++4ahVNrUv3qq08gljZbPjDKTV2TDU36HHv9/8byRwnbxGPa
	wl0KXidDubXna/XbCsEZanjQVn9XPZuVzovZqbmea6uwYHeWL1JAhbN34yq1jN+9Us56
	26VqNQltL0Xnod1m8dwDriHF+8gRAcNeT24LhZ9naGdxx69AxQZ8Wrz+tIF56qxHzVyt
	2hVg==
X-Gm-Message-State: ALyK8tKImj55o0MsXU1Dm8VqOppLi/MEroZu958hBNjbZoJrmRYEh/u7BcvYdmocAn2+2cDVOmBb9Rv5tiCQTw==
X-Received: by 10.157.3.134 with SMTP id f6mr3788347otf.144.1465497542531;
	Thu, 09 Jun 2016 11:39:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Thu, 9 Jun 2016 11:39:01 -0700 (PDT)
In-Reply-To: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Jun 2016 14:39:01 -0400
Message-ID: <CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jun 2016 18:39:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c0562147121780534dcbcaa

--94eb2c0562147121780534dcbcaa
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 8:47 AM, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Hi all!
>
> I'm getting some errors when building Docker. First, go-cross and go-native
> print these messages:
>
> -----------------------------------------------------------------------
> ERROR: go-cross-1.5.2-r0 do_populate_sysroot_setscene:
> '('patchelf-uninative',
> '--set-interpreter',
>
> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>
> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go')'
> failed with exit code 1 and the following output:
> cannot find section .rela.dyn
>
> WARNING: Logfile for failed setscene task is
>
> /home/user/src/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_setscene.28109
> WARNING: Setscene task 458
> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
> go-cross_1.5.bb,
> do_populate_sysroot_setscene) failed with exit code '1' - real task will
> be run
> instead
> -----------------------------------------------------------------------
>
> ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene:
> '('patchelf-uninative',
> '--set-interpreter',
>
> '/home/user/src/prj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
>
> '/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go')'
> failed with exit code 1 and the following output:
> cannot find section .rela.dyn
>
> WARNING: Logfile for failed setscene task is
>
> /home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populate_sysroot_setscene.29146
> WARNING: Setscene task 908
> (/home/user/src/prj/sources/meta-virtualization/recipes-devtools/go-cross/
> go-native_1.4.bb,
> do_populate_sysroot_setscene) failed with exit code '1' - real task will
> be run
> instead
>

I've never seen these ones before.


> -----------------------------------------------------------------------
>
> And there are two Docker dependencies, go-net and go-sqlite, that cannot
> fetch
> sources.
>
> -----------------------------------------------------------------------
> WARNING: go-net-hg-r0 do_fetch: Failed to fetch URL hg://
> code.google.com/p;module=go.net, attempting MIRRORS if available
> ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch command failed with
> exit code 255, output:
> abort: HTTP Error 404: Not Found
>
> ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
> 'hg://code.google.com/p;module=go.net'. Unable to fetch URL from any
> source.
> -----------------------------------------------------------------------
>
> WARNING: go-sqlite-hg-r0 do_fetch: Failed to fetch URL hg://
> code.google.com/p;module=gosqlite, attempting MIRRORS if available
> ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch command failed
> with exit code 255, output:
> abort: HTTP Error 404: Not Found
>
> ERROR: go-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for URL:
> 'hg://code.google.com/p;module=gosqlite'. Unable to fetch URL from any
> source.
> -----------------------------------------------------------------------
>
> Can someone help me to resolve these errors? I'm using krogoth branch for
> oe-core, meta-oe and meta-virtualization.
>
>
Check what I've done in mater. I was able to drop those two dependencies,
sine they
are in the core of go-cross and not something that needs to be separately
fetched
any more.

Over the last few months, go-net and sqlite have been bouncing around as
available
and unavailable, so I finally dropped them.

Bruce


> Regards,
>
> Fabio
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

--94eb2c0562147121780534dcbcaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 9, 2016 at 8:47 AM, Fabio Berton <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:sma=
ll">Hi all!<br><br>I&#39;m getting some errors when building Docker. First,=
 go-cross and go-native<br>print these messages:<br><br>-------------------=
----------------------------------------------------<br>ERROR: go-cross-1.5=
.2-r0 do_populate_sysroot_setscene: &#39;(&#39;patchelf-uninative&#39;,<br>=
&#39;--set-interpreter&#39;,<br>&#39;/home/user/src/prj/build/tmp/sysroots-=
uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;,<br>&#39;/home/user/sr=
c/prj/build/tmp/work/x86_64-linux/go-cross/1.5.2-r0/sstate-install-populate=
_sysroot/x86_64-linux/usr/bin/aarch64-prj-linux/go&#39;)&#39;<br>failed wit=
h exit code 1 and the following output:<br>cannot find section .rela.dyn<br=
><br>WARNING: Logfile for failed setscene task is<br>/home/user/src/prj/bui=
ld/tmp/work/x86_64-linux/go-cross/1.5.2-r0/temp/log.do_populate_sysroot_set=
scene.28109<br>WARNING: Setscene task 458<br>(/home/user/src/prj/sources/me=
ta-virtualization/recipes-devtools/go-cross/<a href=3D"http://go-cross_1.5.=
bb" target=3D"_blank">go-cross_1.5.bb</a>,<br>do_populate_sysroot_setscene)=
 failed with exit code &#39;1&#39; - real task will be run<br>instead<br>--=
---------------------------------------------------------------------<br><b=
r>ERROR: go-native-1.4.3-r0 do_populate_sysroot_setscene: &#39;(&#39;patche=
lf-uninative&#39;,<br>&#39;--set-interpreter&#39;,<br>&#39;/home/user/src/p=
rj/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;,=
<br>&#39;/home/user/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/=
sstate-install-populate_sysroot/x86_64-linux/usr/lib/go/bin/go&#39;)&#39;<b=
r>failed with exit code 1 and the following output:<br>cannot find section =
.rela.dyn<br><br>WARNING: Logfile for failed setscene task is<br>/home/user=
/src/prj/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_populat=
e_sysroot_setscene.29146<br>WARNING: Setscene task 908<br>(/home/user/src/p=
rj/sources/meta-virtualization/recipes-devtools/go-cross/<a href=3D"http://=
go-native_1.4.bb" target=3D"_blank">go-native_1.4.bb</a>,<br>do_populate_sy=
sroot_setscene) failed with exit code &#39;1&#39; - real task will be run<b=
r>instead<br></div></div></blockquote><div><br></div><div>I&#39;ve never se=
en these ones before.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:sm=
all">----------------------------------------------------------------------=
-<br><br>And there are two Docker dependencies, go-net and go-sqlite, that =
cannot fetch<br>sources.<br><br>-------------------------------------------=
----------------------------<br>WARNING: go-net-hg-r0 do_fetch: Failed to f=
etch URL hg://<a href=3D"http://code.google.com/p;module=3Dgo.net" target=
=3D"_blank">code.google.com/p;module=3Dgo.net</a>, attempting MIRRORS if av=
ailable<br>ERROR: go-net-hg-r0 do_fetch: Fetcher failure: Fetch command fai=
led with exit code 255, output:<br>abort: HTTP Error 404: Not Found<br><br>=
ERROR: go-net-hg-r0 do_fetch: Function failed: Fetcher failure for URL: &#3=
9;hg://<a href=3D"http://code.google.com/p;module=3Dgo.net" target=3D"_blan=
k">code.google.com/p;module=3Dgo.net</a>&#39;. Unable to fetch URL from any=
 source.<br>---------------------------------------------------------------=
--------<br><br>WARNING: go-sqlite-hg-r0 do_fetch: Failed to fetch URL hg:/=
/<a href=3D"http://code.google.com/p;module=3Dgosqlite" target=3D"_blank">c=
ode.google.com/p;module=3Dgosqlite</a>, attempting MIRRORS if available<br>=
ERROR: go-sqlite-hg-r0 do_fetch: Fetcher failure: Fetch command failed with=
 exit code 255, output:<br>abort: HTTP Error 404: Not Found<br><br>ERROR: g=
o-sqlite-hg-r0 do_fetch: Function failed: Fetcher failure for URL: &#39;hg:=
//<a href=3D"http://code.google.com/p;module=3Dgosqlite" target=3D"_blank">=
code.google.com/p;module=3Dgosqlite</a>&#39;. Unable to fetch URL from any =
source.<br>----------------------------------------------------------------=
-------<br><br>Can someone help me to resolve these errors? I&#39;m using k=
rogoth branch for oe-core, meta-oe and meta-virtualization.<br><br></div></=
div></blockquote><div><br></div><div>Check what I&#39;ve done in mater. I w=
as able to drop those two dependencies, sine they</div><div>are in the core=
 of go-cross and not something that needs to be separately fetched</div><di=
v>any more.</div><div><br></div><div>Over the last few months, go-net and s=
qlite have been bouncing around as available</div><div>and unavailable, so =
I finally dropped them.</div><div><br></div><div>Bruce</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family=
:monospace,monospace;font-size:small">Regards,<br><br>Fabio<br></div></div>
<br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--94eb2c0562147121780534dcbcaa--
