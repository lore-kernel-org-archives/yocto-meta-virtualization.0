Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63CA7E007EF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Feb 2014 04:43:10 -0800 (PST)
Received: by mail-lb0-f180.google.com with SMTP id n15so7981379lbi.25
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Feb 2014 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=txxRHbHbVArTRoKQSzU3c3QiJDve9rFAZWnqGZHRREs=;
	b=j5zUMr2R0PNU8dyLYbeQjoiwgJ77uxJhURhLXjAjCIUyr/6G0trhFMnfJOvgLfMzcY
	W8LN+lMm568HuQfGtnMmmUKlg3idD7BtSHlFRd9w75QY9qGT4DNCEHokGoXmjMPQ/TEs
	jddXyejfl4Hd3cQppiW4a6zRWlHVf6P/Bc3SO1PuVzZ1tNZCZi2gdebo+hgLKKErJcJe
	qtl9bHcgm46hd1fzyv/9ts3xEPBIpcLNaoBO9WG9L796AaZqOWFBHVNj/2KkZoW3opic
	MKObXiaOx7sT7lfu+/PrNRc/eUwj0+kNcDQvCdd3UzWa0c73Mg8rJW/hfCsZBv1UHttt
	e0Pg==
MIME-Version: 1.0
X-Received: by 10.112.45.108 with SMTP id l12mr881116lbm.21.1392295389401;
	Thu, 13 Feb 2014 04:43:09 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Thu, 13 Feb 2014 04:43:09 -0800 (PST)
In-Reply-To: <1392290269.37071.YahooMailNeo@web162001.mail.bf1.yahoo.com>
References: <1392290269.37071.YahooMailNeo@web162001.mail.bf1.yahoo.com>
Date: Thu, 13 Feb 2014 07:43:09 -0500
Message-ID: <CABZSBQddrC7omUDosH9bHHEJrDq0VM4+que=K1XhYxGKOKL74A@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Venkatesh Gota <v_gota@yahoo.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Build error: do_rootfs: libxenstore3.0-4.1.2-r1.0@x86_64
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
X-List-Received-Date: Thu, 13 Feb 2014 12:43:11 -0000
Content-Type: multipart/alternative; boundary=001a1134bfc81b952c04f24908fb

--001a1134bfc81b952c04f24908fb
Content-Type: text/plain; charset=ISO-8859-1

Are you building the xen-image-minimal or including xen in one of your core
images?

The xen version in the dylan branch is fairly old and is known to not build
properly - if you are trying to build a xen image, I'd recommend moving
forward to a newer branch (or backporting the xen recipe to dylan).

Cheers,
-Chris


On Thu, Feb 13, 2014 at 6:17 AM, Venkatesh Gota <v_gota@yahoo.com> wrote:

>
> I pulled dylan meta-virtualization layer into my yocto project based off
> dylan. I am unable to build core-image-* with meta-virtualization included.
> It fails towards the end with this error.
>
> |   49:Installing libxenstore3.0  ########################################
> [  3%]
> | Output from libxenstore3.0-4.1.2-r1.0@x86_64:
> | error: unpacking of archive failed on file /usr/lib64: cpio: rename
> failed - Resource temporarily unavailable
> |   50:Installing eglibc-gconv-.. ########################################
> [  3%]
>
> the file exists, and not sure what is cpio complaining about.
>
> yocto-build:/mnt/vgota/poky/build/tmp-eglibc/work/x86_64-poky-linux$ find
> . | grep libxenstore3.0 | xargs ls -al
> -rw-r--r-- 2 vgota vgota  0 Feb 13 16:32
> ./xen/4.1.2-r1/deploy-rpms/x86_64/libxenstore3.0-4.1.2-r1.0.x86_64.rpm
> lrwxrwxrwx 1 vgota vgota 22 Feb 13 15:29
> ./xen/4.1.2-r1/pkgdata/runtime-reverse/libxenstore3.0 ->
> ../runtime/libxenstore
>
> any insight is appreciated.
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

--001a1134bfc81b952c04f24908fb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are you building the xen-image-minimal or including x=
en in one of your core images?<br></div><div><br></div><div>The xen version=
 in the dylan branch is fairly old and is known to not build properly - if =
you are trying to build a xen image, I&#39;d recommend moving forward to a =
newer branch (or backporting the xen recipe to dylan).</div>
<div><br></div><div>Cheers,</div><div>-Chris</div></div><div class=3D"gmail=
_extra"><br><br><div class=3D"gmail_quote">On Thu, Feb 13, 2014 at 6:17 AM,=
 Venkatesh Gota <span dir=3D"ltr">&lt;<a href=3D"mailto:v_gota@yahoo.com" t=
arget=3D"_blank">v_gota@yahoo.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div style=3D"font-size:12pt;font-famil=
y:HelveticaNeue,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif"><d=
iv>
<br></div><div style=3D"font-style:normal;font-size:16px;background-color:t=
ransparent;font-family:HelveticaNeue,&#39;Helvetica Neue&#39;,Helvetica,Ari=
al,&#39;Lucida Grande&#39;,sans-serif">I pulled dylan meta-virtualization l=
ayer into my yocto project based off dylan. I am unable to build core-image=
-* with meta-virtualization included. It fails towards the end with this er=
ror.</div>
<div style=3D"font-style:normal;font-size:16px;background-color:transparent=
;font-family:HelveticaNeue,&#39;Helvetica Neue&#39;,Helvetica,Arial,&#39;Lu=
cida Grande&#39;,sans-serif"><br></div><div style=3D"background-color:trans=
parent">
| =A0 49:Installing libxenstore3.0 =A0#####################################=
### [ =A03%]</div><div style=3D"background-color:transparent">|
 Output from libxenstore3.0-4.1.2-r1.0@x86_64:</div><div style=3D"backgroun=
d-color:transparent">| error: unpacking of archive failed on file /usr/lib6=
4: cpio: rename failed - Resource temporarily unavailable</div><div style=
=3D"background-color:transparent">
| =A0 50:Installing eglibc-gconv-.. #######################################=
# [ =A03%]</div><div><br></div><div>the file exists, and not sure what is c=
pio complaining about.</div><div><br></div><div><div><div>yocto-build:/mnt/=
vgota/poky/build/tmp-eglibc/work/x86_64-poky-linux$ find . | grep libxensto=
re3.0 | xargs ls -al</div>
<div>-rw-r--r-- 2 vgota vgota =A00 Feb 13 16:32 ./xen/4.1.2-r1/deploy-rpms/=
x86_64/libxenstore3.0-4.1.2-r1.0.x86_64.rpm</div><div>lrwxrwxrwx 1 vgota vg=
ota 22 Feb 13 15:29 ./xen/4.1.2-r1/pkgdata/runtime-reverse/libxenstore3.0 -=
&gt; ../runtime/libxenstore</div>
<div><br></div><div>any insight is appreciated.</div></div><div><br></div><=
/div></div></div><br>_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
<br></blockquote></div><br></div>

--001a1134bfc81b952c04f24908fb--
