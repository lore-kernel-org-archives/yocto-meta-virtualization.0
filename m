Return-Path: <valerio@debevv.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B228AE00DD7; Tue, 16 Jan 2018 08:46:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	T_DKIM_INVALID autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_DKIM_INVALID DKIM-Signature header exists but is not valid
Received: from out12.keliweb.com (out12.keliweb.com [51.15.185.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7C60E00D6A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jan 2018 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debevv.com; 
	s=default;
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=nvsW9figlxHS0G1htzN5IcC6MYQXNgukueTqkPjSWgQ=;
	b=oy2GZoQMJfmBBG/hPshXRSC81n
	O1NKHfMai6XkeEru5x6sA3fsvrBwo0J42I1LoOa4lU4PZRfRYro5QlpbJIlAZgq4Tke/ssjZT/cuH
	J3EB62OXeBAfA/q2coH5TzT3AfsgU4++57Y4I6iygwfx8T2iOykSMmuPm2T9vsqeuk3GgGlIxATL7
	pUnRtTWcwFdxdMJogQEZ+fSJVO4litxCDQ/Hd9hVrGAcKBLWfHc7w5fdPHKrhMDKVlVEXdTiXAi+7
	E1WUmzgejMkumhItoKV9EDgLR+kTMm6U/dQWBOfrFwolTE4Wjwxo+uqLgYMVGRqk8ABFq1bE9zayL
	mIMZRe4g==;
Received: from [212.29.154.22] (port=33478 helo=[192.168.1.3])
	by out12.keliweb.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <valerio@debevv.com>) id 1ebUNI-0003YQ-5w
	for meta-virtualization@yoctoproject.org;
	Tue, 16 Jan 2018 17:46:12 +0100
To: meta-virtualization@yoctoproject.org
References: <9e2f6fe9-5114-7f66-8137-24d45ee9a9b9@debevv.com>
	<d1fd3195-0da5-f09b-b8b9-220bfdc01a4c@debevv.com>
From: Valerio De Benedetto <valerio@debevv.com>
Message-ID: <ec90fa09-7fca-7ca8-f158-23a80bf6c388@debevv.com>
Date: Tue, 16 Jan 2018 17:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <d1fd3195-0da5-f09b-b8b9-220bfdc01a4c@debevv.com>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - out12.keliweb.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - debevv.com
X-Get-Message-Sender-Via: out12.keliweb.com: authenticated_id:
	valerio@debevv.com
X-Authenticated-Sender: out12.keliweb.com: valerio@debevv.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Add python3-terminal RDEPENDS to docker-compose
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
X-List-Received-Date: Tue, 16 Jan 2018 16:46:14 -0000
X-Groupsio-MsgNum: 3145
Content-Type: multipart/mixed; boundary="------------49C0EE459ABA4731FD330819"
Content-Language: en-GB

--------------49C0EE459ABA4731FD330819
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

The dependency docker-compose is missing for module tty is 
python3-terminal, this patch adds it to recipe RDEPENDS.
(running docker-compose on the target system was failing with 
"ImportError: No module named 'tty'")

--------------49C0EE459ABA4731FD330819
Content-Type: text/x-patch;
 name="0001-add-python3-terminal-RDEPENDS-to-docker-compose-reci.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-add-python3-terminal-RDEPENDS-to-docker-compose-reci.pa";
 filename*1="tch"

From b6a02510b3e4674714057ddf6c938dbee7ef0348 Mon Sep 17 00:00:00 2001
From: Valerio De Benedetto <valerio@debevv.com>
Date: Tue, 16 Jan 2018 17:14:55 +0100
Subject: [PATCH] add python3-terminal RDEPENDS to docker-compose recipe

---
 recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
index 50e76b7..4e761d0 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-pyyaml \
   ${PYTHON_PN}-requests \
   ${PYTHON_PN}-six \
+  ${PYTHON_PN}-terminal \
   ${PYTHON_PN}-texttable \
   ${PYTHON_PN}-urllib3 \
   ${PYTHON_PN}-websocket-client \
-- 
2.7.4


--------------49C0EE459ABA4731FD330819--
