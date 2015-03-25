Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F768E0095D; Wed, 25 Mar 2015 16:06:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
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
	*      [209.85.218.49 listed in list.dnswl.org]
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB1D2E00959
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Mar 2015 16:06:50 -0700 (PDT)
Received: by oier21 with SMTP id r21so35222985oie.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Mar 2015 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7fwb4XAwEkMJ9kQ9380etpAn6HmLeLVNjtA9ChJLzQw=;
	b=jcc0Fvirnp6LJG7VipbXpDK4WXCAjHg0RtElnJxrW/UtpkcOqd4WuRgx60Aa8urcto
	9IE6WMu+R64dLomx4xBkoamDGwGCj7TtwyA+m9zSKQZctTqnCrzghjOYhq2zUKsC/0MK
	wZpsWjSfx/I9WNIwuJT9+WpREskdbfP19uAB4fq2RgOqVKBqMZK1/0JGSf8OeEAtQvwh
	b1tmvTV96dWfRcqdlayqLOjbI/gj4UnMc78eLvcvca+bi9pntyWwI/XHZGolw98Zm/wG
	WDeW+VCLFBEY/zs+MYFUkFeRj1Ov3Jl9bscxpSb2eL+zKIWl1PPdcuMyttAxD76w8LeZ
	Stnw==
MIME-Version: 1.0
X-Received: by 10.60.92.71 with SMTP id ck7mr9518345oeb.14.1427324810140; Wed,
	25 Mar 2015 16:06:50 -0700 (PDT)
Received: by 10.76.4.173 with HTTP; Wed, 25 Mar 2015 16:06:50 -0700 (PDT)
In-Reply-To: <CACrgodcAc18Qn=Vjz_A7NYrSaJCnESmdWsBhfauhPiaRZv=ENg@mail.gmail.com>
References: <CACrgodeNuWsECmFftXE3t3V8hvZGMu6spLXyw+KdPc5GPcUt6A@mail.gmail.com>
	<CADkTA4MSmK4bj=yv-YkjVwP2RzUo+_3Dn=yJcP9e9JNw1CaVSw@mail.gmail.com>
	<CADkTA4MnUz6zq-QTjNZa9PYGGSJczOtrrcPck6hz0XQUcAEo1Q@mail.gmail.com>
	<CACrgodcAc18Qn=Vjz_A7NYrSaJCnESmdWsBhfauhPiaRZv=ENg@mail.gmail.com>
Date: Thu, 26 Mar 2015 07:06:50 +0800
Message-ID: <CACrgodft=cEw4-F-AH-U7MoUSyMqRXCPox-y1hjBMcmVCKpm7g@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: bblayers configuration
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
X-List-Received-Date: Wed, 25 Mar 2015 23:06:55 -0000
Content-Type: multipart/alternative; boundary=047d7b33caf249a272051224f4de

--047d7b33caf249a272051224f4de
Content-Type: text/plain; charset=UTF-8

I tried git clone again meta-virtualization/oe-core/meta-oe with '-b dizzy'
branch option
now it starting build without pervious errors.

2015-03-25 12:29 GMT+08:00 Lai Eddy <eddy.lai.tw@gmail.com>:

> I have just modified local.conf to set machine to genericx86-64
> my host is Ubuntu14.04 and build with yocto 1.7.1 dizzy
>
> 2015-03-25 12:17 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
>> On Tue, Mar 24, 2015 at 11:53 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > On Tue, Mar 24, 2015 at 9:15 PM, Lai Eddy <eddy.lai.tw@gmail.com>
>> wrote:
>> >> according to README in meta-virtualization
>> >> I download all the related repo. and add following to my
>> conf/bblayers.conf
>> >>
>> >>   /media/data/poky/meta-virtualization \
>> >>   /media/data/poky/oe-core/meta \
>> >>   /media/data/poky/meta-oe/meta-oe \
>> >>   /media/data/poky/meta-oe/meta-python \
>> >>   /media/data/poky/meta-oe/meta-networking \
>> >>   /media/data/poky/meta-oe/meta-filesystems \
>> >>
>> >> then change BBFILE_PRIORITY_openembedded-layer = "4" insdide the
>> layer.conf
>> >> of meta-oe/meta-oe, have I done everything right?
>> >>
>> >> I go following error after issue "bitbake kvm-image-minimal"
>> >
>> > I haven't built this image type in quite some time .. but I just
>> > configured and launched
>> > a build.  I'll let you know the result, one way or the other.
>>
>> My build did complete (fast machine), and I was able to generate this
>> image just
>> fine.
>>
>> Do you have anything in particular set in your local.conf that is
>> setting incompatible
>> licenses ? That's what the error message you are getting suggests to me.
>>
>> Bruce
>>
>> >
>> > Bruce
>> >
>> >>
>> >> File:
>> >>
>> '__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
>> >> lineno: 2, function:
>> >>
>> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
>> >>      0001:def
>> >>
>> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
>> >>  *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) ==
>> "x"
>> >> or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
>> >>      0003:        d.setVar("EXTRA_OECMAKE",
>> >> d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes",
>> "-DWITH_GNOME=no"))
>> >>      0004:        d.setVar("DEPENDS", " ".join(i for i in
>> >> d.getVar("DEPENDS").split() if i != "gconf"))
>> >>      0005:
>> >> Exception: NameError: global name 'incompatible_license_contains' is
>> not
>> >> defined
>> >>
>> >>
>> >>
>> >> --
>> >> _______________________________________________
>> >> meta-virtualization mailing list
>> >> meta-virtualization@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >>
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>
>

--047d7b33caf249a272051224f4de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tried git clone again meta-virtualization/oe-core/m=
eta-oe with &#39;-b dizzy&#39; branch option<br></div>now it starting build=
 without pervious errors.<br></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">2015-03-25 12:29 GMT+08:00 Lai Eddy <span dir=3D"ltr">&lt=
;<a href=3D"mailto:eddy.lai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gma=
il.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div>I have just modified local.conf to set machine to genericx86-64<br></di=
v>my host is Ubuntu14.04 and build with yocto 1.7.1 dizzy<br></div><div cla=
ss=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2015-03-25 12:17 GMT+08:00 Bruce Ashfield <span dir=3D"ltr=
">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.a=
shfield@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>O=
n Tue, Mar 24, 2015 at 11:53 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt; On Tue, Mar 24, 2015 at 9:15 PM, Lai Eddy &lt;<a href=3D"mailto:eddy.l=
ai.tw@gmail.com" target=3D"_blank">eddy.lai.tw@gmail.com</a>&gt; wrote:<br>
&gt;&gt; according to README in meta-virtualization<br>
&gt;&gt; I download all the related repo. and add following to my conf/bbla=
yers.conf<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/meta-virtualization \<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/oe-core/meta \<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/meta-oe/meta-oe \<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/meta-oe/meta-python \<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/meta-oe/meta-networking \<br>
&gt;&gt;=C2=A0 =C2=A0/media/data/poky/meta-oe/meta-filesystems \<br>
&gt;&gt;<br>
&gt;&gt; then change BBFILE_PRIORITY_openembedded-layer =3D &quot;4&quot; i=
nsdide the layer.conf<br>
&gt;&gt; of meta-oe/meta-oe, have I done everything right?<br>
&gt;&gt;<br>
&gt;&gt; I go following error after issue &quot;bitbake kvm-image-minimal&q=
uot;<br>
&gt;<br>
&gt; I haven&#39;t built this image type in quite some time .. but I just<b=
r>
&gt; configured and launched<br>
&gt; a build.=C2=A0 I&#39;ll let you know the result, one way or the other.=
<br>
<br>
</span>My build did complete (fast machine), and I was able to generate thi=
s image just<br>
fine.<br>
<br>
Do you have anything in particular set in your local.conf that is<br>
setting incompatible<br>
licenses ? That&#39;s what the error message you are getting suggests to me=
.<br>
<span><font color=3D"#888888"><br>
Bruce<br>
</font></span><div><div><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; File:<br>
&gt;&gt; &#39;__anon_35__media_data_poky_oe_core_meta_recipes_support_libpr=
oxy_libproxy_0_4_11_bb&#39;,<br>
&gt;&gt; lineno: 2, function:<br>
&gt;&gt; __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_l=
ibproxy_0_4_11_bb<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0001:def<br>
&gt;&gt; __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_l=
ibproxy_0_4_11_bb(d):<br>
&gt;&gt;=C2=A0 *** 0002:=C2=A0 =C2=A0 if incompatible_license_contains(&quo=
t;GPLv3&quot;, &quot;x&quot;, &quot;&quot;, d) =3D=3D &quot;x&quot;<br>
&gt;&gt; or bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;x11&quot;,=
 &quot;x&quot;, &quot;&quot;, d) =3D=3D &quot;&quot;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0003:=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quo=
t;EXTRA_OECMAKE&quot;,<br>
&gt;&gt; d.getVar(&quot;EXTRA_OECMAKE&quot;).replace(&quot;-DWITH_GNOME=3Dy=
es&quot;, &quot;-DWITH_GNOME=3Dno&quot;))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0004:=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quo=
t;DEPENDS&quot;, &quot; &quot;.join(i for i in<br>
&gt;&gt; d.getVar(&quot;DEPENDS&quot;).split() if i !=3D &quot;gconf&quot;)=
)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0005:<br>
&gt;&gt; Exception: NameError: global name &#39;incompatible_license_contai=
ns&#39; is not<br>
&gt;&gt; defined<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"=
_blank">meta-virtualization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtua=
lization</a><br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b33caf249a272051224f4de--
