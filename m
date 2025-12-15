Return-Path: <aguirre.nicolas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D046FD41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:43 +0000 (UTC)
Subject: Re: [PATCH 2/2] libvirt: fix build failure with libxml2 2.15.1
To: meta-virtualization@lists.yoctoproject.org
From: "Nicolas Aguirre" <aguirre.nicolas@gmail.com>
X-Originating-Location: =?UTF-8?B?w45sZS1kZS1GcmFuY2UsIEZS?= (82.66.97.10)
X-Originating-Platform: Mac Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 02:05:40 -0800
References: <20251203082423.2747388-1-hongxu.jia@windriver.com> <20251203082423.2747388-2-hongxu.jia@windriver.com>
In-Reply-To: <20251203082423.2747388-2-hongxu.jia@windriver.com>
Message-ID: <159171.1765793140865389299@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="QxMVul8XBDWi9w3svkov"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9481

--QxMVul8XBDWi9w3svkov
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm facing the same build error where libxml2 has now deprecated a bunch of=
 APIs.

Just for my understanding, I was about to fix it by bumping the version of =
libvirt to v11.10.0 which has already this fix in and I'm wondering if it's=
 better to patch like this of if bumping to a newer version is safe?
It's maybe because we want to keep libvirt in version v11.8.0 ?

Best regards,

Nicolas

--QxMVul8XBDWi9w3svkov
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p class=3D"font-claude-response-body break-words whitespace-normal leading=
-[1.7]">Hello,</p>
<p class=3D"font-claude-response-body break-words whitespace-normal leading=
-[1.7]"><br />I'm facing the same build error where libxml2 has now depreca=
ted a bunch of APIs.</p>
<p class=3D"font-claude-response-body break-words whitespace-normal leading=
-[1.7]">Just for my understanding, I was about to fix it by bumping the ver=
sion of libvirt to v11.10.0 which has already this fix in and I'm wondering=
 if it's better to patch like this of if bumping to a newer version is safe=
?&nbsp;<br />It's maybe because we want to keep libvirt in version v11.8.0 =
?</p>
<p class=3D"font-claude-response-body break-words whitespace-pre-wrap leadi=
ng-[1.7]">Best regards,</p>
<p class=3D"font-claude-response-body break-words whitespace-pre-wrap leadi=
ng-[1.7]">Nicolas</p>
</div>

--QxMVul8XBDWi9w3svkov--

