Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC5CC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:45:14 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.1441.1669221908929141640
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 99B2912EB8;
	Wed, 23 Nov 2022 17:45:05 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.78]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxsru-0ewuYq0; Wed, 23 Nov 2022 17:45:02 +0100
Date: Wed, 23 Nov 2022 17:44:57 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <XU7TLR.FXTLP0CRB8BJ@t-online.de>
In-Reply-To: 
	<CADkTA4NCtsL_X9arHs7z1F2-Tf_npbTqqcFWZUh=TBLXfdC_Yw@mail.gmail.com>
References: <20221030161333.12430-1-f_l_k@t-online.de>
	<20221030161333.12430-2-f_l_k@t-online.de>
	<CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
	<6GGOKR.9UDK9PG7M6LM3@t-online.de>
	<1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
	<CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com>
	<V6BTKR.V7B3NTHJZAU82@t-online.de>
	<CADkTA4NCtsL_X9arHs7z1F2-Tf_npbTqqcFWZUh=TBLXfdC_Yw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eEKg+9vHeVGRep9Lkryh"
X-TOI-EXPURGATEID: 150726::1669221902-2E8B5EA1-065BC002/0/0 CLEAN NORMAL
X-TOI-MSGID: 82b54667-2a22-42d0-bfdb-affa43e5d3df
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:45:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7697

--=-eEKg+9vHeVGRep9Lkryh
Content-Type: text/plain; charset=us-ascii; format=flowed

After updating OE core master i was able to reproduce the issue. Looks 
like its related to the latest glib-2.0 update. I've sent a patch for it

Am Mi, 23. Nov 2022 um 09:09:47 -0500 schrieb Bruce Ashfield 
<bruce.ashfield@gmail.com>:
> I had to put this aside for a bit, but am back looking at it.
> 
> The build paths QA failure comes from the use of glib-mkenums, which
> definitely generates files with absolute paths. I don't see any
> options available in its documentation for sysroot or relative
> patches, so I'll need to come up with some sort of fixup.
> 
> I'm also now seeing a failure on the latest OE core master (and
> master-next of meta-virt), like this:
> 
> nfig-domain-capabilities-os.c.o.d -o
> libvirt-gconfig/libvirt-gconfig-1.0.so.0.4000.0.p/libvirt-gconfig-domain-capabilities-os.c.o
> -c ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
> | In file included from
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:52,
> |                  from
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/gobject/gbinding.h:30,
> |                  from
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib-object.h:24,
> |                  from ../git/libvirt-gconfig/libvirt-gconfig.h:27,
> |                  from
> ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:23:
> | ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c: In
> function 'search_firmwares':
> | 
> ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:70:26:
> error: pointer targets in passing argument 1 of 'strcmp' differ in
> signedness [-Werror=pointer-sign]
> |    70 |     if (!g_str_equal(node->name, "enum"))
> | 
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/ghash.h:165:39:
> note: in definition of macro 'g_str_equal'
> |   165 | #define g_str_equal(v1, v2) (strcmp ((v1), (v2)) == 0)
> |       |                                       ^~
> | In file included from
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:35,
> |                  from
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:32:
> | 
> /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/string.h:156:32:
> note: expected 'const char *' but argument is of type 'const xmlChar
> *' {aka 'const unsigned char *'}
> |   156 | extern int strcmp (const char *__s1, const char *__s2)
> |       |                    ~~~~~~~~~~~~^~~~
> | cc1: all warnings being treated as errors
> 
> If you have any cycles free, I'd be interested to know if this is
> specific to my builders, or if others are seeing the same thing.
> 
> Bruce
> 
> On Fri, Nov 4, 2022 at 3:23 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield 
>> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>:
>> 
>>  but libvirt still has other TMPDIR QA warnings that still haven't 
>> been fixed, so I don't consider this an absolute blocker. I'll have 
>> a look and try to fix it.
>> 
>> 
>>  Thanks for the help!
>> 
>>  Markus
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7695): 
> <https://lists.yoctoproject.org/g/meta-virtualization/message/7695>
> Mute This Topic: <https://lists.yoctoproject.org/mt/94667263/3618223>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org 
> <mailto:meta-virtualization+owner@lists.yoctoproject.org>
> Unsubscribe: 
> <https://lists.yoctoproject.org/g/meta-virtualization/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-eEKg+9vHeVGRep9Lkryh
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">After updating OE core master i was able to reproduce the issue. Looks like its related to the latest glib-2.0 update. I've sent a patch for it</div><div id="geary-quote" dir="auto"><br>Am Mi, 23. Nov 2022 um 09:09:47 -0500 schrieb Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I had to put this aside for a bit, but am back looking at it.

The build paths QA failure comes from the use of glib-mkenums, which
definitely generates files with absolute paths. I don't see any
options available in its documentation for sysroot or relative
patches, so I'll need to come up with some sort of fixup.

I'm also now seeing a failure on the latest OE core master (and
master-next of meta-virt), like this:

nfig-domain-capabilities-os.c.o.d -o
libvirt-gconfig/libvirt-gconfig-1.0.so.0.4000.0.p/libvirt-gconfig-domain-capabilities-os.c.o
-c ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
| In file included from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:52,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/gobject/gbinding.h:30,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib-object.h:24,
|                  from ../git/libvirt-gconfig/libvirt-gconfig.h:27,
|                  from
../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:23:
| ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c: In
function 'search_firmwares':
| ../git/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c:70:26:
error: pointer targets in passing argument 1 of 'strcmp' differ in
signedness [-Werror=pointer-sign]
|    70 |     if (!g_str_equal(node-&gt;name, "enum"))
| /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/ghash.h:165:39:
note: in definition of macro 'g_str_equal'
|   165 | #define g_str_equal(v1, v2) (strcmp ((v1), (v2)) == 0)
|       |                                       ^~
| In file included from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:35,
|                  from
/opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:32:
| /opt/poky/build/tmp/work/core2-64-poky-linux/libvirt-glib/4.0.0-r0/recipe-sysroot/usr/include/string.h:156:32:
note: expected 'const char *' but argument is of type 'const xmlChar
*' {aka 'const unsigned char *'}
|   156 | extern int strcmp (const char *__s1, const char *__s2)
|       |                    ~~~~~~~~~~~~^~~~
| cc1: all warnings being treated as errors

If you have any cycles free, I'd be interested to know if this is
specific to my builders, or if others are seeing the same thing.

Bruce

On Fri, Nov 4, 2022 at 3:23 AM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield &lt;<a href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;:

 but libvirt still has other TMPDIR QA warnings that still haven't been fixed, so I don't consider this an absolute blocker. I'll have a look and try to fix it.


 Thanks for the help!

 Markus
</blockquote>


<div>-- 
</div>- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#7695): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/7695">https://lists.yoctoproject.org/g/meta-virtualization/message/7695</a>
Mute This Topic: <a href="https://lists.yoctoproject.org/mt/94667263/3618223">https://lists.yoctoproject.org/mt/94667263/3618223</a>
Group Owner: <a href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-eEKg+9vHeVGRep9Lkryh--


