Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4391CCD3426
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 09:32:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11030.1777887121491609417
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 May 2026 02:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Up/01a56;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+massimiliano.minella.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A058260125;
	Mon,  4 May 2026 09:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5722DC4AF0B;
	Mon,  4 May 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777887120;
	bh=9O/sMpWzUybl7qDRncasrBNv22xL0Ny12TGgzPAefdQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Up/01a56jkaIBnvnr3jWFigtjwRJxaZCMUoNjxsEkoj6Umxz6qAsylBCLrVozePa+
	 D+MriSlGrZypawWUJOcBTy7CBGmp5+rxeBzjUFHcOT93QNfHISn1ZV3+lz4owx09v9
	 hHKGfcpf0v83UTIsjWoGMntYn7a37y7HCcepF+qYuu4cccQoWagdugUYjhO5Qbef+I
	 Ozh2vb0dKWbUuHEoqESg70S8KlT8l6EhSKlOghItPaZQkCyyUeacy0GxRhnS/FQB5r
	 k3gBfdQkTl04PsUhvaX+yvOCVGuup2f5O8HLr8hAKrPwMijiKlyD/e/DpdRhFfnKqE
	 Yg9Pq4j2YydTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490D1CD3426;
	Mon,  4 May 2026 09:32:00 +0000 (UTC)
From: Massimiliano Minella via B4 Relay <devnull+massimiliano.minella.se.com@kernel.org>
Date: Mon, 04 May 2026 11:31:31 +0200
Subject: [PATCH RESEND] libvirt: fix python3 compatibility in
 hook_support.py
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-fix_libvirt_hook_script-v1-1-9838f5c96a1a@se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887118; l=2695;
 i=massimiliano.minella@se.com; s=20250121; h=from:subject:message-id;
 bh=WIm3+HRBDm95euJ7aoFgH+VcB3BkwzHKs9HUhk3P1KA=;
 b=uVO8jLFFdzxDdmiKnXCr5xsmNAwmibZ9yfDBZqnXeQkkve1qnuANQXoHC/HZ8Oz6+M8T9x+2r
 X2b7U/k7I3eCbREGcvgBclUogd4m/64kNE2zMCyEa/oDKQZrFUDbFTI
X-Developer-Key: i=massimiliano.minella@se.com; a=ed25519;
 pk=p6Og4stDBPm4cBEySH8oVWARLO52pxVayNFqHslSXU0=
X-Endpoint-Received: by B4 Relay for massimiliano.minella@se.com/20250121
 with auth_id=325
X-Original-From: Massimiliano Minella <massimiliano.minella@se.com>
Reply-To: massimiliano.minella@se.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 May 2026 09:32:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9785

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
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEmyckwKYPNcpMkpYoTLqAMKbmymMFAmleiv0ACgkQTLqAMKbm
ymMqMg//Tf36TeanEuR7dC2FhYcBCxEGl+hoG3OGpD4CJNLmUSN37aqCByV5P0kM
2Tc9JKFZr7fXTNTtkmUoiBRm+3+evDliwdQOCRhGK5Ujen2cYP1BTd8hhkHvzb3U
mswUqFOCEFeCkqt6j/dYc5JtJ//9S22sATEQ6fdUrLLoZRsCRy6we1qXK+Fmpkd0
7UdQd4WLKjFTg+mIGQ3MdEGI9TP5+EcLHziKhb6AnLZ0S0ejV3xdjrnNDneV1yMq
xisdj3Car6N1k39+9aMWYssOUiibKeiQLz0YKJayCfoIk69QtM5bnAx7QNquroAa
fbC7jFjqnSq4yvtlBjQ5d1MuFGSHlE7RSSd6DSz+wbkte4zAFbKWushuGxS08Hf/
qYo9aSZv+ifbB1uPfH49/C3MLp7j+its2l8KTGUbHfwe9yN4IWT1F5cYgJEzeOuO
WjP8G22ym4h/82w+2C0de6eAYCNAL5BuXFaAJfxC74fb2UIn/rh6zGIn6m+EK8sp
AvclYgU1SHwWNUPzCchdSJP6twIhESHdPbMJLxSpwJVT0IYg5ONod4/lS3JFKpvI
bjpF18k0b3orSeS61KyEUiXkazDa34I9biml0TC00wW2I/13Z3c36ztamKHmUmmv
rLEfAunD20nlsbxfXCApgEMwt0OoeiueeI/BKm/9raoYqcmJvdg=
=pK58
-----END PGP SIGNATURE-----
-- 
Massimiliano Minella <massimiliano.minella@se.com>



