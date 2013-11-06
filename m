Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1A40E0174E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 17:08:31 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id eo20so3848335lab.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2013 17:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b1/4g6jKVqE9XTG6Fv3oYjh5Cf32YJpYUu6YbEiC+ik=;
	b=CQKl+dJDiCCbnHPmmm7lP993IWUIDxzQZpIXGUZVrZbvqhLPidIjrYiRpP8+hKYpjl
	kbxuKagV06EYvJR25OzVeE3YCS1r8904tRv6Wt5h9DKbLs7Na/J7f5sD2kPGN/A8R3vY
	r71EjhJV+Ui+Nfj6M8vokFNZQ0I5mxVjW3WzIJ3d8giYE0OIWxrKhsvuU31EsOLoX9Un
	UON+eZcySKDOxtBxQbQIDHLonDI4CeRr3ZiZpZd9xHiTinRPJQ41V6207fueD88olvmo
	eBDnFCNcwpW2oh7kUkA8q0HH5TxIK4JrkcOVrPAUyTMQFCfuWdZlNVVSWJRpDTyk+II/
	oFGw==
MIME-Version: 1.0
X-Received: by 10.112.9.195 with SMTP id c3mr641460lbb.33.1383700110056; Tue,
	05 Nov 2013 17:08:30 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Tue, 5 Nov 2013 17:08:29 -0800 (PST)
In-Reply-To: <52792C7A.4040801@twobit.us>
References: <1383495029-26728-1-git-send-email-flihp@twobit.us>
	<CABZSBQfVAtZkacVcUVfxbu8CN7R605eSzn_dJ1TOkSHQ3eETUg@mail.gmail.com>
	<52792C7A.4040801@twobit.us>
Date: Tue, 5 Nov 2013 20:08:29 -0500
Message-ID: <CABZSBQeVjnMN3YP00UKLt1VkHb_R+SL0O2y+qiqt=LL=jt2zKA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Wed, 06 Nov 2013 01:08:35 -0000
Content-Type: multipart/alternative; boundary=001a1135e1f68920cd04ea77c927

--001a1135e1f68920cd04ea77c927
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 5, 2013 at 12:35 PM, Philip Tricca <flihp@twobit.us> wrote:

> Hi Chris,
>
> On 11/04/2013 10:17 PM, Chris Patterson wrote:
> > I would think that libsdl should be included as a runtime dependency if
> > enabled...?  Though looking through recipes, it would appear that many
> > PACKAGECONFIG users ignore the runtime dependencies (presumably assuming
> > that the image will include them if the functionality is desired - or
> > perhaps specifying only when the dependency is strictly required as a
> > result?).
>
> I left out the runtime dependency stuff because the xen-qemu package
> will end up with a dependency on libsdl if it's enabled. I was under the
> impression that this is sufficient though I'm not exactly sure how the
> dependency is created. Honestly I was happy to write it off as
> bitbake/OE magic. I've tested dom0 images with sdl enabled and disabled
> and the xen-qemu package will pull the SDL library into the image if
> it's enabled.
>
> Are you seeing different behavior?
>

My mistake - my grep foo was weak - the libSDL shared objects are special
enough to deserve capitalization. :)

Coincidentally, after sending that email, a few minutes later I read a
thread on oe-core that explained that RDEPENDS wasn't needed if it matches
DEPENDS (and vice versa). And now I know...

Cheers,
-Chris

--001a1135e1f68920cd04ea77c927
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Nov 5, 2013 at 12:35 PM, Philip Tricca <span dir=3D"ltr">&l=
t;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Chris,<br>
<div class=3D"im"><br>
On 11/04/2013 10:17 PM, Chris Patterson wrote:<br>
&gt; I would think that libsdl should be included as a runtime dependency i=
f<br>
&gt; enabled...? =A0Though looking through recipes, it would appear that ma=
ny<br>
&gt; PACKAGECONFIG users ignore the runtime dependencies (presumably assumi=
ng<br>
&gt; that the image will include them if the functionality is desired - or<=
br>
&gt; perhaps specifying only when the dependency is strictly required as a<=
br>
&gt; result?).<br>
<br>
</div>I left out the runtime dependency stuff because the xen-qemu package<=
br>
will end up with a dependency on libsdl if it&#39;s enabled. I was under th=
e<br>
impression that this is sufficient though I&#39;m not exactly sure how the<=
br>
dependency is created. Honestly I was happy to write it off as<br>
bitbake/OE magic. I&#39;ve tested dom0 images with sdl enabled and disabled=
<br>
and the xen-qemu package will pull the SDL library into the image if<br>
it&#39;s enabled.<br>
<br>
Are you seeing different behavior?<br></blockquote><div><br></div><div>My m=
istake - my grep foo was weak - the libSDL shared objects are special enoug=
h to deserve capitalization. :)<br><br> </div><div>Coincidentally, after se=
nding that email, a few minutes later I read a thread on oe-core that expla=
ined that RDEPENDS wasn&#39;t needed if it matches DEPENDS (and vice versa)=
. And now I know...<br>
<br></div><div>Cheers,<br></div><div>-Chris<br></div></div></div></div>

--001a1135e1f68920cd04ea77c927--
