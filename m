Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F4BCD5BBF
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:42:07 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.8306.1725540118331001777
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Sep 2024 05:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CFbDNExN;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d889207d1aso533231a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725540117; x=1726144917; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1sFX5ixyFe+XslSEAJZyaxktI0Coilwv1dXA6qYrnI=;
        b=CFbDNExNUrs7VmgbSY/ViwIjVsGLY/0klDcrR56fwuqHYbuRE5hiCpXypPEnedeCa/
         aSOjS/SCwVoLzYKICM5a2Rf+W39Qvp4wtFoM8UgGSNppFNP3Fb7CyCSzICBsnhAp0+t1
         7aG8bHqV2BQse+pcaNBsVQUx+gEqlQstigfqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540117; x=1726144917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1sFX5ixyFe+XslSEAJZyaxktI0Coilwv1dXA6qYrnI=;
        b=PLw0a2ZjTVv+uG7E6cfH9F2clYeJ1/kPwL4tQLHFGdw1f+JyiLL5C1n6mO8cc/p5au
         P8ETNtm9ATS2uMO2gCCSNAdxSXopl6NMAbRuSRZcQ6AJ/wXZS+v2KAm4Vby1JO+naebU
         YQKW8ejj98EdQYn0ywVt7Aa8eSMps91QdQqxLOALRQ15sg43kIFHASrxK6Vkv7iak82x
         JpjTcU6gMrLXbjGFHS/j3qxilaydyXsUoJdb1C0/b414kPqGpNBfrBegaDfmx/eevRXH
         zMWgvCzqqYh0/+tI/OZiD3pFpWDtqyxg2akXEcqrM5z0w/+gSIl/6G/o59fx/UPSwNqD
         jkZA==
X-Gm-Message-State: AOJu0YxuoaiOMYeW/4hDrT+CsoIkLnyr4x7e0O+TjkkvPGatvSwugKNo
	zH+2ooQ1h2yWZPAaNmoF0BaByWVsjaTGPih12ZlHMtC3KG4Ovo+aCA7tDFdD/Xzy3gpC/jvQ1xY
	f1S4=
X-Google-Smtp-Source: AGHT+IGOvf+s78Z7RyRcJFsEl+phd5z/Yn6/7AVfwxK/5BJEjF30cARtaVTG9bq5wAndm4iTfzHrdw==
X-Received: by 2002:a17:90a:7802:b0:2da:9490:900c with SMTP id 98e67ed59e1d1-2da94909088mr5419453a91.21.1725540117041;
        Thu, 05 Sep 2024 05:41:57 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:91fe:ba6:7790:e46e:8894])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85afb2d88sm15475092a91.0.2024.09.05.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:56 -0700 (PDT)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] kubernetes: Security fix for CVE-2023-3676 and CVE-2023-3955
Date: Thu,  5 Sep 2024 18:11:46 +0530
Message-Id: <20240905124146.831764-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 12:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8867

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit:
https://github.com/kubernetes/kubernetes/commit/7da6d72c05dffb3b87e62e2bc8c3228ea12ba1b9
& https://github.com/kubernetes/kubernetes/commit/a53faf5e17ed0b0771a605c6401ba4cbf297b59a

Reference:
https://github.com/kubernetes/kubernetes/issues/119339

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2023-3676.patch | 46 +++++++++++
 .../kubernetes/kubernetes/CVE-2023-3955.patch | 79 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  2 +
 3 files changed, 127 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-3676.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-3955.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-3676.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-3676.patch
new file mode 100644
index 00000000..835a43b4
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-3676.patch
@@ -0,0 +1,46 @@
+From c80d622eed1c499139c51bd47c8dc756682fbe66 Mon Sep 17 00:00:00 2001
+From: James Sturtevant <jstur@microsoft.com>
+Date: Thu, 20 Jul 2023 17:00:29 +0000
+Subject: [PATCH] Use env varaibles for passing path
+
+The subpath could be passed a powershell subexpression which would be executed by kubelet with privilege.  Switching to pass the arguments via environment variables means the subexpression won't be evaluated.
+
+Signed-off-by: James Sturtevant <jstur@microsoft.com>
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/a53faf5e17ed0b0771a605c6401ba4cbf297b59a]
+CVE: CVE-2023-3676
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/volume/util/subpath/subpath_windows.go | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/pkg/volume/util/subpath/subpath_windows.go b/pkg/volume/util/subpath/subpath_windows.go
+index e7f77d07f7557..c9b67aa8c78ff 100644
+--- a/pkg/volume/util/subpath/subpath_windows.go
++++ b/pkg/volume/util/subpath/subpath_windows.go
+@@ -76,8 +76,10 @@ func getUpperPath(path string) string {
+ // Check whether a directory/file is a link type or not
+ // LinkType could be SymbolicLink, Junction, or HardLink
+ func isLinkPath(path string) (bool, error) {
+-	cmd := fmt.Sprintf("(Get-Item -LiteralPath %q).LinkType", path)
+-	output, err := exec.Command("powershell", "/c", cmd).CombinedOutput()
++	cmd := exec.Command("powershell", "/c", "$ErrorActionPreference = 'Stop'; (Get-Item -Force -LiteralPath $env:linkpath).LinkType")
++	cmd.Env = append(os.Environ(), fmt.Sprintf("linkpath=%s", path))
++	klog.V(8).Infof("Executing command: %q", cmd.String())
++	output, err := cmd.CombinedOutput()
+ 	if err != nil {
+ 		return false, err
+ 	}
+@@ -114,8 +116,10 @@ func evalSymlink(path string) (string, error) {
+ 		}
+ 	}
+ 	// This command will give the target path of a given symlink
+-	cmd := fmt.Sprintf("(Get-Item -LiteralPath %q).Target", upperpath)
+-	output, err := exec.Command("powershell", "/c", cmd).CombinedOutput()
++	cmd := exec.Command("powershell", "/c", "$ErrorActionPreference = 'Stop'; (Get-Item -Force -LiteralPath $env:linkpath).Target")
++	cmd.Env = append(os.Environ(), fmt.Sprintf("linkpath=%s", upperpath))
++	klog.V(8).Infof("Executing command: %q", cmd.String())
++	output, err := cmd.CombinedOutput()
+ 	if err != nil {
+ 		return "", err
+ 	}
diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-3955.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-3955.patch
new file mode 100644
index 00000000..6f2518cf
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-3955.patch
@@ -0,0 +1,79 @@
+From 5f89e4c983f0a55e6cc21ca05436496a208d8eb7 Mon Sep 17 00:00:00 2001
+From: James Sturtevant <jstur@microsoft.com>
+Date: Mon, 17 Jul 2023 14:24:02 -0700
+Subject: [PATCH] Use environment varaibles for parameters in Powershell
+
+As a defense in depth, pass parameters to powershell via environment variables.
+
+Signed-off-by: James Sturtevant <jstur@microsoft.com>
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/7da6d72c05dffb3b87e62e2bc8c3228ea12ba1b9]
+CVE: CVE-2023-3955
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/volume/util/util.go                       | 12 +++++++----
+ .../src/k8s.io/mount-utils/mount_windows.go   | 20 +++++++++++++------
+ 2 files changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/pkg/volume/util/util.go b/pkg/volume/util/util.go
+index dffdfd6d899c1..cd70a52d277db 100644
+--- a/pkg/volume/util/util.go
++++ b/pkg/volume/util/util.go
+@@ -656,11 +656,15 @@ func HasMountRefs(mountPath string, mountRefs []string) bool {
+ func WriteVolumeCache(deviceMountPath string, exec utilexec.Interface) error {
+ 	// If runtime os is windows, execute Write-VolumeCache powershell command on the disk
+ 	if runtime.GOOS == "windows" {
+-		cmd := fmt.Sprintf("Get-Volume -FilePath %s | Write-Volumecache", deviceMountPath)
+-		output, err := exec.Command("powershell", "/c", cmd).CombinedOutput()
+-		klog.Infof("command (%q) execeuted: %v, output: %q", cmd, err, string(output))
++		cmdString := "Get-Volume -FilePath $env:mountpath | Write-Volumecache"
++		cmd := exec.Command("powershell", "/c", cmdString)
++		env := append(os.Environ(), fmt.Sprintf("mountpath=%s", deviceMountPath))
++		cmd.SetEnv(env)
++		klog.Infof("Executing command: %q", cmdString)
++		output, err := cmd.CombinedOutput()
++		klog.Infof("command (%q) execeuted: %v, output: %q", cmdString, err, string(output))
+ 		if err != nil {
+-			return fmt.Errorf("command (%q) failed: %v, output: %q", cmd, err, string(output))
++			return fmt.Errorf("command (%q) failed: %v, output: %q", cmdString, err, string(output))
+ 		}
+ 	}
+ 	// For linux runtime, it skips because unmount will automatically flush disk data
+diff --git a/staging/src/k8s.io/mount-utils/mount_windows.go b/staging/src/k8s.io/mount-utils/mount_windows.go
+index c7fcde5fc98f4..d96bf2237899f 100644
+--- a/staging/src/k8s.io/mount-utils/mount_windows.go
++++ b/staging/src/k8s.io/mount-utils/mount_windows.go
+@@ -278,10 +278,16 @@ func (mounter *SafeFormatAndMount) formatAndMountSensitive(source string, target
+ 		fstype = "NTFS"
+ 	}
+ 
+-	// format disk if it is unformatted(raw)
+-	cmd := fmt.Sprintf("Get-Disk -Number %s | Where partitionstyle -eq 'raw' | Initialize-Disk -PartitionStyle GPT -PassThru"+
+-		" | New-Partition -UseMaximumSize | Format-Volume -FileSystem %s -Confirm:$false", source, fstype)
+-	if output, err := mounter.Exec.Command("powershell", "/c", cmd).CombinedOutput(); err != nil {
++	cmdString := "Get-Disk -Number $env:source | Where partitionstyle -eq 'raw' | Initialize-Disk -PartitionStyle GPT -PassThru" +
++		" | New-Partition -UseMaximumSize | Format-Volume -FileSystem $env:fstype -Confirm:$false"
++	cmd := mounter.Exec.Command("powershell", "/c", cmdString)
++	env := append(os.Environ(),
++		fmt.Sprintf("source=%s", source),
++		fmt.Sprintf("fstype=%s", fstype),
++	)
++	cmd.SetEnv(env)
++	klog.V(8).Infof("Executing command: %q", cmdString)
++	if output, err := cmd.CombinedOutput(); err != nil {
+ 		return fmt.Errorf("diskMount: format disk failed, error: %v, output: %q", err, string(output))
+ 	}
+ 	klog.V(4).Infof("diskMount: Disk successfully formatted, disk: %q, fstype: %q", source, fstype)
+@@ -303,8 +309,10 @@ func (mounter *SafeFormatAndMount) formatAndMountSensitive(source string, target
+ 
+ // ListVolumesOnDisk - returns back list of volumes(volumeIDs) in the disk (requested in diskID).
+ func listVolumesOnDisk(diskID string) (volumeIDs []string, err error) {
+-	cmd := fmt.Sprintf("(Get-Disk -DeviceId %s | Get-Partition | Get-Volume).UniqueId", diskID)
+-	output, err := exec.Command("powershell", "/c", cmd).CombinedOutput()
++	cmd := exec.Command("powershell", "/c", "(Get-Disk -DeviceId $env:diskID | Get-Partition | Get-Volume).UniqueId")
++	cmd.Env = append(os.Environ(), fmt.Sprintf("diskID=%s", diskID))
++	klog.V(8).Infof("Executing command: %q", cmd.String())
++	output, err := cmd.CombinedOutput()
+ 	klog.V(4).Infof("listVolumesOnDisk id from %s: %s", diskID, string(output))
+ 	if err != nil {
+ 		return []string{}, fmt.Errorf("error list volumes on disk. cmd: %s, output: %s, error: %v", cmd, string(output), err)
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f374892a..9d6179e0 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -36,6 +36,8 @@ SRC_URI:append = " \
            file://k8s-init \
            file://99-kubernetes.conf \
            file://CVE-2024-3177.patch;patchdir=src/import \
+           file://CVE-2023-3955.patch;patchdir=src/import \
+           file://CVE-2023-3676.patch;patchdir=src/import \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1


