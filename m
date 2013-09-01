Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D7F2E00282
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2013 07:42:22 -0700 (PDT)
Received: by mail-la0-f42.google.com with SMTP id ep20so2852567lab.15
	for <meta-virtualization@yoctoproject.org>;
	Sun, 01 Sep 2013 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EvuFxT5zig/6ZSOUqgXmcVYPaWVKA93OOr3ov1blvWo=;
	b=AD/DQhZPdsjs51DsrcMazeisGGvCAyCbm5+WypdOA6nFg5clcjht/VEixGV5vMkSn9
	h9FVBljO8esR41pWEn2/TYizlVQu2QuKRx2np0bFjZsa9d4NqdOJilpsuIUf2NWs+OQt
	GABvuXTTMSKULDcJtrtYVDEj0sQIO0JRn8zTCKUdbEHtQ7V4TOpNy95bpuObwHhUbS+j
	CyHlU4+izK5KMOV1cJFTzsHYVjRg+JSVJHksPcbNWBNnr0k0z/DaDyWzkq8Nb/s0qddh
	rgZ5qQktnr63nxYLC++3DxXYj0k99YIgusyE5vw/u66ZvPn2XOlseQhksMuVTfUoujG3
	akUQ==
MIME-Version: 1.0
X-Received: by 10.152.120.73 with SMTP id la9mr17088171lab.3.1378046541348;
	Sun, 01 Sep 2013 07:42:21 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Sun, 1 Sep 2013 07:42:21 -0700 (PDT)
In-Reply-To: <CADkTA4O-OzWqQiee1HxmvkggpUzEDCYHMdKRqJbXQa_SZLjiZw@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
	<CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
	<CABZSBQfzXc4sKVmqxHwUNM+b+kNv4OaxNVTURsujH-YLzYsFdw@mail.gmail.com>
	<CADkTA4O-OzWqQiee1HxmvkggpUzEDCYHMdKRqJbXQa_SZLjiZw@mail.gmail.com>
Date: Sun, 1 Sep 2013 10:42:21 -0400
Message-ID: <CABZSBQfJPny7yV7oKZPiakcdm6wJCNFjuPZWTrL8ZdfUBk-dTQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Sun, 01 Sep 2013 14:42:33 -0000
Content-Type: multipart/alternative; boundary=089e011766e594c3ec04e553768e

--089e011766e594c3ec04e553768e
Content-Type: text/plain; charset=ISO-8859-1

I went back and double checked - you are right - last fragment wins as you
expected. I typo'd something in my test :)  Thanks for the clarification,
that makes more sense to me now.


On Sun, Sep 1, 2013 at 12:01 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Sat, Aug 31, 2013 at 10:12 PM, Chris Patterson <cjp256@gmail.com>
> wrote:
> > That'd be great.  There are a couple areas that could perhaps use some
> work,
> > as the fragment is a little excessive in some of the options and/or
> could be
> > broken up a little better, if desired.  On this topic, I have a couple
> > questions that would help steer me in the right direction in the future:
> >
> > 1) One thing that's not immediately clear for me is the question of how
> to
> > best handle a case where a CONFIG_XXX option may in one instance, be
> > desirable to be built in - vs being a module in another?  Doing a quick
> test
> > seems to imply the first defined instance is the one used, but I'm not
> sure
> > if there are any well defined rules for conflict resolution.  The reason
> I'm
> > asking is there are CONFIG_XXX=y instances in this config - some of which
> > need to be built in, some required, and some just *preferably* built in
> for
> > various use cases. Specifically CONFIG_XEN_PCIDEV_BACKEND=y provides some
> > useful functionality before a module could otherwise be loaded (prevent a
> > pci device from being owned by a linux driver).
>
> It should be last through the gate that wins, which gives the fragment that
> includes another one a chance to tweak and override what it doesn't like.
>
> If you were really seeing first one being set, then something has broken
> and
> I'll hunt it down, I never assume that something hasn't managed to break
> itself, but it should still be behaving as it has before.
>
> What you may have seen is that KERNEL_FEATURES and .scc files on a
> SRC_URI are applied in a particular order. .scc files and then
> KERNEL_FEATURES,
> so if you want to override a feature, you need to do it with another
> features.
>
> So in your case, you can have that base fragment sets the requirements as
> built in, that's a good start. You could then have a secondary fragment
> which
> sets the preferable options, and more fragments that had completely
> optional
> values. Leaving the recipes and higher level fragments to chose the mix
> they
> want.
>
> Alternatively, you can set them all in the single fragment like it is, and
> then
> the including feature can always override, or from recipe space additional
> features be triggered override the values.
>
> >
> > 2) The other thing I am curious about is how to negotiate the inclusion
> of a
> > KERNEL_FEATURES which has a number of built-in bits.  The approach used
> by
> > kvm is to effectively always enable the fragment if one is including
> > meta-virtualization.  This in and of itself isn't really polluting the
> > target image for those that don't want KVM, because they likely simply
> don't
> > include the built kvm modules (ignoring CONFIG_TUN=y).  However, when you
> > have the =y cases, the user of the layer doesn't have a choice without
> going
> > through and commenting out the KERNEL_FEATURES_append...?  This was the
> > reasoning I took for choosing the base_contains() functionality instead
> of
> > just including it like the other bits (ebtables, vswitch, etc.).  Is the
> > goal for the layer's linux-yocto bbappend to support a "generic" kernel
> (by
> > default) to support all of its packages/images?
>
> An excellent point .. and yes, a layer shouldn't really be setting
> values like this
> unless it was single purpose. If we have Xen and KVM both active and
> available
> via meta-virt, then we really don't want that.
>
> I'd convert KVM to trigger via a IMAGE or DISTRO feature as well, just as
> you've
> done with your fragments.
>
> Cheers,
>
> Bruce
>
> >
> > Take care,
> > -Chris
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--089e011766e594c3ec04e553768e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I went back and double checked - you are right - last frag=
ment wins as you expected. I typo&#39;d something in my test :)=A0 Thanks f=
or the clarification, that makes more sense to me now.<br></div><div class=
=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Sun, Sep 1, 2013 at 12:01 AM, Bruce A=
shfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<div class=3D"im">On Sat, Aug 31, 2013 at 10:12 PM, Chris Patterson &lt;<a =
href=3D"mailto:cjp256@gmail.com">cjp256@gmail.com</a>&gt; wrote:<br>
&gt; That&#39;d be great. =A0There are a couple areas that could perhaps us=
e some work,<br>
&gt; as the fragment is a little excessive in some of the options and/or co=
uld be<br>
&gt; broken up a little better, if desired. =A0On this topic, I have a coup=
le<br>
&gt; questions that would help steer me in the right direction in the futur=
e:<br>
&gt;<br>
&gt; 1) One thing that&#39;s not immediately clear for me is the question o=
f how to<br>
&gt; best handle a case where a CONFIG_XXX option may in one instance, be<b=
r>
&gt; desirable to be built in - vs being a module in another? =A0Doing a qu=
ick test<br>
&gt; seems to imply the first defined instance is the one used, but I&#39;m=
 not sure<br>
&gt; if there are any well defined rules for conflict resolution. =A0The re=
ason I&#39;m<br>
&gt; asking is there are CONFIG_XXX=3Dy instances in this config - some of =
which<br>
&gt; need to be built in, some required, and some just *preferably* built i=
n for<br>
&gt; various use cases. Specifically CONFIG_XEN_PCIDEV_BACKEND=3Dy provides=
 some<br>
&gt; useful functionality before a module could otherwise be loaded (preven=
t a<br>
&gt; pci device from being owned by a linux driver).<br>
<br>
</div>It should be last through the gate that wins, which gives the fragmen=
t that<br>
includes another one a chance to tweak and override what it doesn&#39;t lik=
e.<br>
<br>
If you were really seeing first one being set, then something has broken an=
d<br>
I&#39;ll hunt it down, I never assume that something hasn&#39;t managed to =
break<br>
itself, but it should still be behaving as it has before.<br>
<br>
What you may have seen is that KERNEL_FEATURES and .scc files on a<br>
SRC_URI are applied in a particular order. .scc files and then KERNEL_FEATU=
RES,<br>
so if you want to override a feature, you need to do it with another featur=
es.<br>
<br>
So in your case, you can have that base fragment sets the requirements as<b=
r>
built in, that&#39;s a good start. You could then have a secondary fragment=
 which<br>
sets the preferable options, and more fragments that had completely optiona=
l<br>
values. Leaving the recipes and higher level fragments to chose the mix the=
y<br>
want.<br>
<br>
Alternatively, you can set them all in the single fragment like it is, and =
then<br>
the including feature can always override, or from recipe space additional<=
br>
features be triggered override the values.<br>
<div class=3D"im"><br>
&gt;<br>
&gt; 2) The other thing I am curious about is how to negotiate the inclusio=
n of a<br>
&gt; KERNEL_FEATURES which has a number of built-in bits. =A0The approach u=
sed by<br>
&gt; kvm is to effectively always enable the fragment if one is including<b=
r>
&gt; meta-virtualization. =A0This in and of itself isn&#39;t really polluti=
ng the<br>
&gt; target image for those that don&#39;t want KVM, because they likely si=
mply don&#39;t<br>
&gt; include the built kvm modules (ignoring CONFIG_TUN=3Dy). =A0However, w=
hen you<br>
&gt; have the =3Dy cases, the user of the layer doesn&#39;t have a choice w=
ithout going<br>
&gt; through and commenting out the KERNEL_FEATURES_append...? =A0This was =
the<br>
&gt; reasoning I took for choosing the base_contains() functionality instea=
d of<br>
&gt; just including it like the other bits (ebtables, vswitch, etc.). =A0Is=
 the<br>
&gt; goal for the layer&#39;s linux-yocto bbappend to support a &quot;gener=
ic&quot; kernel (by<br>
&gt; default) to support all of its packages/images?<br>
<br>
</div>An excellent point .. and yes, a layer shouldn&#39;t really be settin=
g<br>
values like this<br>
unless it was single purpose. If we have Xen and KVM both active and availa=
ble<br>
via meta-virt, then we really don&#39;t want that.<br>
<br>
I&#39;d convert KVM to trigger via a IMAGE or DISTRO feature as well, just =
as you&#39;ve<br>
done with your fragments.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Take care,<br>
&gt; -Chris<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>

--089e011766e594c3ec04e553768e--
