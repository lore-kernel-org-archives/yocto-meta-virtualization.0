Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0ADCEFD1E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:34:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10248.1767803646327870781
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 08:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YkB04odl;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+massimiliano.minella.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DDFA6000A;
	Wed,  7 Jan 2026 16:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C33EFC4CEF1;
	Wed,  7 Jan 2026 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767803644;
	bh=nOmKtRSONGuI5vqNzP/kJKkx4r9IK7Q9KJlF68zuc/c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YkB04odlSbtwCH5nAR9BXetqLuWKyTn8jzo0oNYNtXrNeMp5F00PDTcZyJdSgRp0o
	 Nm9OGNEY0p1/L9m166zE/EoBp99hf2JHj5elgRfGhvJsW7p1Bu7ZdBHSRuuoym+sY9
	 Q4jafrgopYT7tv1J4IA3MiyjwxrtdBiLuDAdvEL6rE4CfkTLMum0KryYs5PG/obYme
	 tetuqZsl8IgRfeDFQuOtfgSAtGujiCI2P2g7uBdJZUeMqIqzAElYULnGTKacId/SiB
	 6mhVv/idK0p6j6aVR28AhV4FJBp9WAFmtrLsl4D3ivK8AGm1TCpvKshJmbt8oEqolQ
	 5LqDJM+0Q6BQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F55CFD653;
	Wed,  7 Jan 2026 16:34:04 +0000 (UTC)
From: Massimiliano Minella via B4 Relay <devnull+massimiliano.minella.se.com@kernel.org>
Date: Wed, 07 Jan 2026 17:33:59 +0100
Subject: [PATCH] libvirt: fix python3 compatibility in hook_support.py
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-fix_libvirt_hook_script-v1-1-d0016e043ca4@se.com>
X-B4-Tracking: v=1; b=H4sIAPaKXmkC/x2MWwqAMAzAriL9dtBNfF5FZOisWhQnnYgg3t3hZ
 yDJA4GEKUCTPCB0cWC/R9BpAm7p95kUj5HBoClQY6kmvu3Gw8Vy2sX71QYnfJzKZZrq3GCFVEO
 sD6Go/ue2e98PPExUN2kAAAA=
To: meta-virtualization@lists.yoctoproject.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767803643; l=1846;
 i=massimiliano.minella@se.com; s=20250121; h=from:subject:message-id;
 bh=rROvFh/A5TUsfDeJYorMQKChOPNCM3z8U5Y7jgBNGDA=;
 b=MUnCT8xzbPoxIhkE3+A6mgJTDMwkckek6DkIxKUl1B6yZpMkgKafV7/s3WvU9UOp5PuIr73na
 rO1A6PAYhYXDqhCI5pJ6k+xV1LTgsLK9tNlDTc6nW31Ew0umkTc0OFf
X-Developer-Key: i=massimiliano.minella@se.com; a=ed25519;
 pk=p6Og4stDBPm4cBEySH8oVWARLO52pxVayNFqHslSXU0=
X-Endpoint-Received: by B4 Relay for massimiliano.minella@se.com/20250121
 with auth_id=325
X-Original-From: Massimiliano Minella <massimiliano.minella@se.com>
Reply-To: massimiliano.minella@se.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jan 2026 16:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9530

From: Massimiliano Minella <massimiliano.minella@se.com>

By default Popen expects all the streams to be bytes-like objects but,
in the Popen.communicate() function call, the "input" argument is a
string, making the call fail with the error:

qemu hook error: a bytes-like object is required, not 'str'

Fix the error by setting text mode to True in the subprocess creation.

Also fix the "SyntaxWarning: invalid escape sequence '\w'" in the regex
used to match script names.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 recipes-extended/libvirt/libvirt/hook_support.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git recipes-extended/libvirt/libvirt/hook_support.py recipes-extended/libvirt/libvirt/hook_support.py
index 7c5e2a94..63e78b79 100755
--- recipes-extended/libvirt/libvirt/hook_support.py
+++ recipes-extended/libvirt/libvirt/hook_support.py
@@ -35,7 +35,7 @@ def main():
 			stdin_save = sys.stdin.readlines()
 		# Match the name name of the hook + a dash + atleast
 		# one alpha-numeric character.
-		matcher = re.compile( "%s-\w+" % hook_name )
+		matcher = re.compile( rf"%s-\w+" % hook_name )
 		for file_name in sorted( os.listdir( hook_dir ) ):
 			file_path = os.path.join( hook_dir, file_name )
 			if matcher.match( file_name ) \
@@ -43,7 +43,7 @@ def main():
 			   and os.path.isfile( file_path ) \
 			   and return_value == 0:
 				cmd = [ file_path ] + hook_args
-				p = subprocess.Popen( cmd, stdin=subprocess.PIPE )
+				p = subprocess.Popen( cmd, stdin=subprocess.PIPE, text=True )
 				p.communicate( input = ''.join( stdin_save ) )[0]
 				return_value = p.wait()
 	except Exception as e:

---
base-commit: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
change-id: 20260107-fix_libvirt_hook_script-c31e952080e9

Best regards,
-- 
Massimiliano Minella <massimiliano.minella@se.com>



