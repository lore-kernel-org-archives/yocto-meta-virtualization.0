Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2E3CE00949; Sun,  8 Feb 2015 19:23:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E89DBE0093B
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Feb 2015 19:23:52 -0800 (PST)
Received: by labgq15 with SMTP id gq15so10771647lab.6
	for <meta-virtualization@yoctoproject.org>;
	Sun, 08 Feb 2015 19:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=G/hE+wqB8LAjXBYi3ZDEulNaHc1WdUuoveK6XS62iQ8=;
	b=AArH5KXqX8FFc8/lu8hj+HZ/BUbhQ/znIj0OW/F2JCnoAibGPwv6XMDFDc5m3kpyjV
	j8EAY6CnSZcNXAPt+nh5gBXHGabNw77mNXrV9lDjZXjVOrb8bip69F2/by1S/iiouIoF
	pHanlyEYEWxDZDYUyCqHaa7LDW4DR9sTO+kz4JLIQwpvi0XMma9QWKvCHpyyBhMyynqA
	HN3hgSkG/F00FqtIGG6rXrWGDhujnd833xaZ7MaKZ6EdBqKxMCmqq7KgDB3thrzvgpqP
	6EftpWNm752XXzWOO+L2jaeDistpqWo7ghrfNmbba+VlAirNmdm9uQ2EjTqgnVzKaqte
	VyIA==
MIME-Version: 1.0
X-Received: by 10.112.140.168 with SMTP id rh8mr14260723lbb.25.1423452230459; 
	Sun, 08 Feb 2015 19:23:50 -0800 (PST)
Received: by 10.114.21.169 with HTTP; Sun, 8 Feb 2015 19:23:50 -0800 (PST)
In-Reply-To: <8a863ca11d0b44828288dc519b97f610@BN1BFFO11FD007.protection.gbl>
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
	<CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
	<CABZSBQc4u6OArq-jaz=WJCQ06RVmv3q3Z=Mw016LDvkz=FfPxA@mail.gmail.com>
	<CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
	<CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
	<4f5c5ef09adc4e219522de0788b5912d@BN1AFFO11FD019.protection.gbl>
	<CABZSBQf8-YR5T4JjUsUMf5ONLhP-GVH=Fu5Xo8aeetKYFTqyYw@mail.gmail.com>
	<8a863ca11d0b44828288dc519b97f610@BN1BFFO11FD007.protection.gbl>
Date: Sun, 8 Feb 2015 22:23:50 -0500
Message-ID: <CABZSBQdXa0VDKttMq32KQLnWxZ0zUjfo8_KtdYw6K87i6dhwzg@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Mon, 09 Feb 2015 03:23:57 -0000
Content-Type: multipart/alternative; boundary=001a11c25d668d245a050e9f4c56

--001a11c25d668d245a050e9f4c56
Content-Type: text/plain; charset=UTF-8

> >
> >
> > Thanks for that, that looks good! For the cherry-pick of the "xen: break
> > out firmware bits" could you just add Signed-off by for Eric Chanudet
> > <eric.chanudet@gmail.com> for the portions I borrowed from his other
> work
> > on openxt?  I meant to do that before I pushed.  I fixed and rebased @
> > https://github.com/cjp256/meta-virtualization/tree/add-aarch64-support
> >
> > Otherwise, there is just some minor recipe cleanup and an issue with
> > hvmloader picking up ipxe I wanted to look into which could be done with
> > follow up patches.
>
> I have updated my branch from yours, I have also rebased it on top of
> current master.
>
>
I pushed a couple minor cleanup patches to my branch, feel free to absorb
them or I can submit them independently later.

>
> >
> > Out of curiosity, I noticed in your qemu bbappend that you use
> > PACKAGECONFIG[_defaultval].  I've never seen that before, is that
> > supported?  I have seen PACKAGECONFIG += which I believe accomplishes
> your
> > goal.  Your method apparently works though :)
> >
>
> The _defaultval flag is an bitbake internal one, it is how bitbake stores
> the ??= value until its finished parsing. So += onto it works as desired.
> Looking into it I cannot find any use or mention on whether or not internal
> flags are acceptable for use in user recipes. I liked this method the best
> as it allowed for future control of what is done within to be in the
> meta-virtualization layer, the alternatives to get the same functionality
> is to either submit the change to oe-core or to use ??= and override the
> default (which means the override might get out of sync and cause people
> issues). I had initially planned on submitting the qemu changes to oe-core
> (until I found the _defaultval trick), do you think that would be a better
> approach?
>
>
It may be a better approach (if they'll take it), but it does not matter to
me.  It's a little surprising there isn't a built-in mechanic to support
this case, but props for figuring out how to get around that.

Also PACKAGECONFIG += "xen" unfortunately ignores the value set by ??= and
> becomes just "xen", _append would work fine however it will always apply
> the append (even when overriding with _pn-qemu = "" from local.conf). Which
> is why the patch uses += to the defaultval.
>
>
Thanks for the info, good to know.


> Regards,
> Nathan
>

--001a11c25d668d245a050e9f4c56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"h5">
&gt;<br>
&gt;<br>
&gt; Thanks for that, that looks good! For the cherry-pick of the &quot;xen=
: break<br>
&gt; out firmware bits&quot; could you just add Signed-off by for Eric Chan=
udet<br>
&gt; &lt;<a href=3D"mailto:eric.chanudet@gmail.com">eric.chanudet@gmail.com=
</a>&gt; for the portions I borrowed from his other work<br>
&gt; on openxt?=C2=A0 I meant to do that before I pushed.=C2=A0 I fixed and=
 rebased @<br>
&gt; <a href=3D"https://github.com/cjp256/meta-virtualization/tree/add-aarc=
h64-support" target=3D"_blank">https://github.com/cjp256/meta-virtualizatio=
n/tree/add-aarch64-support</a><br>
&gt;<br>
&gt; Otherwise, there is just some minor recipe cleanup and an issue with<b=
r>
&gt; hvmloader picking up ipxe I wanted to look into which could be done wi=
th<br>
&gt; follow up patches.<br>
<br>
</div></div>I have updated my branch from yours, I have also rebased it on =
top of current master.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>I pushed a cou=
ple minor cleanup patches to my branch, feel free to absorb them or I can s=
ubmit them independently later.<br><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"">
&gt;<br>
&gt;<br>
&gt; Out of curiosity, I noticed in your qemu bbappend that you use<br>
&gt; PACKAGECONFIG[_defaultval].=C2=A0 I&#39;ve never seen that before, is =
that<br>
&gt; supported?=C2=A0 I have seen PACKAGECONFIG +=3D which I believe accomp=
lishes your<br>
&gt; goal.=C2=A0 Your method apparently works though :)<br>
&gt;<br>
<br>
</span>The _defaultval flag is an bitbake internal one, it is how bitbake s=
tores the ??=3D value until its finished parsing. So +=3D onto it works as =
desired. Looking into it I cannot find any use or mention on whether or not=
 internal flags are acceptable for use in user recipes. I liked this method=
 the best as it allowed for future control of what is done within to be in =
the meta-virtualization layer, the alternatives to get the same functionali=
ty is to either submit the change to oe-core or to use ??=3D and override t=
he default (which means the override might get out of sync and cause people=
 issues). I had initially planned on submitting the qemu changes to oe-core=
 (until I found the _defaultval trick), do you think that would be a better=
 approach?<br>
<br></blockquote><div><br></div><div>It may be a better approach (if they&#=
39;ll take it), but it does not matter to me.=C2=A0 It&#39;s a little surpr=
ising there isn&#39;t a built-in mechanic to support this case, but props f=
or figuring out how to get around that.=C2=A0 <br><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Also PACKAGECONFIG +=3D &quot;xen&quot; unfortunately ignores the value set=
 by ??=3D and becomes just &quot;xen&quot;, _append would work fine however=
 it will always apply the append (even when overriding with _pn-qemu =3D &q=
uot;&quot; from local.conf). Which is why the patch uses +=3D to the defaul=
tval.<br>
<br></blockquote><div><br></div><div>Thanks for the info, good to know.<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Nathan<br>
</blockquote></div><br></div></div>

--001a11c25d668d245a050e9f4c56--
