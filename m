Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647CDCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:36:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24432.1780504582729967973
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 09:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HHaYpFk4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4908b92904fso76168145e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780504581; x=1781109381; darn=lists.yoctoproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yc5GfYpmJeciROSuBWh1oi/f4k8b8+OBCX0lUJzHC7U=;
        b=HHaYpFk4cPG13w1dY71H0rRqQulbemeD1K1OwbdNLMtnmAKktZ2JTl1tYK0cINOHVV
         fKRANNUWk4reFAktL9UQYgMRWStt+sGDSN6nuNjEg0LCW0k/eepjcpeem6moEoghYaaK
         R3QnCwu/EmjIuM047JO6z5llCusowgy4ZyJpTWYCtRxcIMGPsfKzzw38GcrRI8v6CqtQ
         axPlZ3a8LNhmIp5gqkyG3gzahisMTqdNoyw0eAqq3qtqrQhG4hjeLEgcejg4TnlD9+wB
         ybGZRUuEO+b9TMZTgD/7X4wJTh8rBBa27gBxZj4pEYAjTN/T70LBnVJBW60aiUvjv0px
         Elmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504581; x=1781109381;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc5GfYpmJeciROSuBWh1oi/f4k8b8+OBCX0lUJzHC7U=;
        b=TwXdrgj4cb/CyLjzC9Rmte1vTwLid3HQXc15u9p00+h9ym39wEHn30TQShxYgCjEbJ
         CnIOlHwU0sZd3pl+ZRGTsqdJHADHQRqMRktJsW2bTclppXsypHmgqsNUH8i9a8A6KenF
         8/nyNdx8ovbfX0B72B0KJyJhl7dhd59jvoriEapewLZTVt8nnx02o3EMw1f2RYrMJevv
         yuC4njhVwowYF4PUYUaIAV8yAT0TYlfx7JqbHLa/8zWpNadNK4hTcs8xFFQ1StFtK5Ap
         uXwIsdkLWGG/9tpb7FN0EEJEdFDzzlICCrUKKuWHfNEFTw1RC1+xKIKC1H6lnG+Vv55Q
         qReg==
X-Gm-Message-State: AOJu0YwcXEScUzBPIHahFyYXvZfznPDbNBzqCmVOxBXkbIGGOOFXgSaS
	+wOcaD9t1s5hXPfu4yagYplEzyFJSu1l/p6uDw/rlJAwbSr1Ac2lB1vsIIYznZ4d
X-Gm-Gg: Acq92OEFC8gsvw9KPjSptfKxF3Zo4yAOnr7k88UuCqwbu9uq8AQj+C6/ftiuTDwOxot
	AhzsrajQZf5aEd1lvjof2a1V0zJxTL33nVY5kCkpmLkLyFa9iD5K0zXuSuXLMs2D14xmWtUNFvg
	1gRLfYf+AgZ7Op1+GC1ZwbLrI0cfcSyxfEMvx0CBNIAfyxwTniK1yzNtk9qCNkfx2wwo/kooRyS
	NFR82jND0mnuklUgEAnQ/E+5nCn4EZ7qpE3xN0N2hBL0hSlU/s4bJ+3KMhQGraE8jsJ3jxGqmIa
	2Mh6fKSP6j4AHgnIGiicF822winKKI9fzN7hTg7ZasxTGuZUqumyTVyetCLBbJv6qNXl8oD5mgD
	SRbGW4etdusWfsUCapoyOgis8No1KLJNqUc0GxbEAVyS2Gn2r8/+Td2VxGeaMl8v0NK9cxwo9FM
	AxNXz/AxtWWS4PBbTMIOMXuCNDQDSQy3joBu1f1yCcoPULl1ZR9t1rRDDGRNJOY2E10j+Jx4PuY
	DbFpEzcSce2I8eo12taxYKhxAN01g==
X-Received: by 2002:a05:600c:4750:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490b610a305mr67639745e9.32.1780504580857;
        Wed, 03 Jun 2026 09:36:20 -0700 (PDT)
Received: from [127.0.1.1] (88-169-106-40.subs.proxad.net. [88.169.106.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm8533793f8f.12.2026.06.03.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:36:20 -0700 (PDT)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
Date: Wed, 03 Jun 2026 18:36:18 +0200
Subject: [scarthgap][PATCH] libvirt: fix python3 compatibility in
 hook_support.py
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-backport_fix_libvirt_hook_script-v1-1-81e73d7e2d94@se.com>
X-B4-Tracking: v=1; b=H4sIAAFYIGoC/yWNUQqDMBAFryL73YAJtKm9ikhI4mq2FhM2UQri3
 Zu2f2/gMXNARibM8GgOYNwpU1wryEsDPth1RkFjZVCturVX2Qln/ZIiFzPR27zI7VR3iHEx2TO
 lIvSkleusvI/aQ9Ukxnr9Jfrhz3lzT/Tl6+2zt1zCbNMA5/kBW1SAtY8AAAA=
X-Change-ID: 20260519-backport_fix_libvirt_hook_script-7f72b9a18d7c
To: meta-virtualization@lists.yoctoproject.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780504579; l=2061;
 i=massimiliano.minella@se.com; s=20250121; h=from:subject:message-id;
 bh=uisEE34zLwIAap2zC0Kvn6hekXyrlqB4c2eZbz2vcP0=;
 b=bDYRucez6R88Ezp7SQCBeSkXDOqXk1GY/N3QxzpkBgvdyexH4odLf+F/xsuZ6Irgw/x/3PFZf
 uIx23axhj5rCahSBRMeA5hRLdqrNShMXcK1NQ5v1qg3XTVqFt62e6jx
X-Developer-Key: i=massimiliano.minella@se.com; a=ed25519;
 pk=p6Og4stDBPm4cBEySH8oVWARLO52pxVayNFqHslSXU0=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 16:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9845

From: Massimiliano Minella <massimiliano.minella@se.com>

By default Popen expects all the streams to be bytes-like objects but,
in the Popen.communicate() function call, the "input" argument is a
string, making the call fail with the error:

qemu hook error: a bytes-like object is required, not 'str'

Fix the error by setting text mode to True in the subprocess creation.

Also fix the "SyntaxWarning: invalid escape sequence '\w'" in the regex
used to match script names.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit fb1d9123351c86d7804e78e1518788913fb7c672)

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 recipes-extended/libvirt/libvirt/hook_support.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt/hook_support.py b/recipes-extended/libvirt/libvirt/hook_support.py
index 7c5e2a94..63e78b79 100755
--- a/recipes-extended/libvirt/libvirt/hook_support.py
+++ b/recipes-extended/libvirt/libvirt/hook_support.py
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
base-commit: 89da4f56b4c510059f8dc1527d289d9fd4fef133
change-id: 20260519-backport_fix_libvirt_hook_script-7f72b9a18d7c

Best regards,
--  
Massimiliano Minella <massimiliano.minella@se.com>


