Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2CDC0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:05:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.10069.1699362304050290106
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 05:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 5462EEF60
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  7 Nov 2023 14:05:01 +0100 (CET)
Received: from [192.168.178.62] ([84.154.173.54]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0LlM-0Z5exE0; Tue, 7 Nov 2023 14:05:00 +0100
Date: Tue, 07 Nov 2023 11:27:11 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH] libvirt-glib: add
 VALA_MESON_ENABLE_FLAG and VALA_MESON_DISABLE_FLAG
To: meta-virtualization@lists.yoctoproject.org
Message-Id: <B11R3S.54HAT2F7D7MQ1@t-online.de>
In-Reply-To: <179550144DFF7F38.20624@lists.yoctoproject.org>
References: <179550144DFF7F38.20624@lists.yoctoproject.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mKcbT3KQGi2z/mLcxvAT"
X-TOI-EXPURGATEID: 150726::1699362300-A905F9D6-0A07A898/0/0 CLEAN NORMAL
X-TOI-MSGID: 8123733a-9868-484b-86da-32f4fbb32229
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 13:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8438

--=-mKcbT3KQGi2z/mLcxvAT
Content-Type: text/plain; charset=us-ascii; format=flowed

This patch is RFC. I missed to mark it like this, sorry

On Tue, Nov 7 2023 at 11:21:29 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> According to changes in vala.bbclass we need to add them
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb 
> b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> index 7ca65a95..22b02d42 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -19,3 +19,5 @@ GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
>  GTKDOC_MESON_ENABLE_FLAG = 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> +VALA_MESON_ENABLE_FLAG = 'enabled'
> +VALA_MESON_DISABLE_FLAG = 'disabled'
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8435): 
> <https://lists.yoctoproject.org/g/meta-virtualization/message/8435>
> Mute This Topic: <https://lists.yoctoproject.org/mt/102440144/3618223>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org 
> <mailto:meta-virtualization+owner@lists.yoctoproject.org>
> Unsubscribe: 
> <https://lists.yoctoproject.org/g/meta-virtualization/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-mKcbT3KQGi2z/mLcxvAT
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This patch is RFC. I missed to mark it like this, sorry</div></div><div id="geary-quote" dir="auto"><br>On Tue, Nov 7 2023 at 11:21:29 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">According to changes in vala.bbclass we need to add them

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
index 7ca65a95..22b02d42 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -19,3 +19,5 @@ GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
+VALA_MESON_ENABLE_FLAG = 'enabled'
+VALA_MESON_DISABLE_FLAG = 'disabled'
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#8435): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/8435">https://lists.yoctoproject.org/g/meta-virtualization/message/8435</a>
Mute This Topic: <a href="https://lists.yoctoproject.org/mt/102440144/3618223">https://lists.yoctoproject.org/mt/102440144/3618223</a>
Group Owner: <a href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-mKcbT3KQGi2z/mLcxvAT--


