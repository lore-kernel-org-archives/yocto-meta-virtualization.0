Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E78CE0078B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Dec 2013 22:38:07 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB46c6ra012461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 3 Dec 2013 22:38:06 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 22:38:06 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Dec 2013 01:38:01 -0500
Message-ID: <1386139082-23111-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] libvirt: uprev to v1.2.0
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
X-List-Received-Date: Wed, 04 Dec 2013 06:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upreving libvirt to v1.2.0 released Dec 2, 2013.

As part of this uprev, existing patches that are part of the 1.2 release have
been dropped, and existing functionality checked for regressions.

From the libvirt release notes:

 Features:
    Add support for gluster pool (Eric Blake),
    Separation of python binding (Daniel P. Berrange),
    vbox: add support for 4.3 APIs (Ryota Ozaki)

 Documentation:
    fix typos in libvirt.h.in (Chen Hanxiao),
    Link libvirt-sandbox from apps page (Daniel P. Berrange),
    Add docs about audit subsystem logging (Daniel P. Berrange),
    virsh: fix doc typos (Nehal J Wani),
    Fix typos in various docs (Nehal J Wani),
    LXC: add securetty related note in Device nodes (Gao feng),
    Fix three minor typos (Yuri Chornoivan),
    storage: fix typo in previous patch (Eric Blake),
    storage: document gluster pool (Eric Blake),
    virDomainReboot: Document that migration might be unsafe (Michal Privoznik),
    delete extra character (Wangyufei (A)),
    maint: fix comment typos. (Eric Blake),
    improve job info details (Eric Blake),
    fix a typo in formatnwfilter.html.in (Chen Hanxiao),
    Improve cgroups docs to cover systemd integration (Daniel P. Berrange),
    fix typos in libvirt.h.in (Chen Hanxiao),
    fix virDomainRestoreFlags description bug (Wang Yufei),
    grammar fixes (Eric Blake),
    add SystemTap to apps using libvirt (Jonathan Lebon),
    fix a typo in formatnwfilter (Chen Hanxiao),
    caps: Fix function docs for virCapabilitiesAddHostNUMACell (Peter Krempa)

Portability:
    tests: fix virpcitest with read-only srcdir (Eric Blake),
    tests: guarantee abs_srcdir in all C tests (Eric Blake),
    look for numad in /usr/sbin (Jim Fehlig),
    build: Don't fail on '&lt;' or '&gt;' with old xmllint (Martin Kletzander),
    spec: fix libvirt-docs subpackage on RHEL-6 (Michael Chapman),
    Don't depend on syslog.service (Guido GÃ¼nther),
    qemuMonitorJSONGetCPUx86Data: Don't fail on ancient qemus (Michal Privoznik),
    build: work around super-old readline.h (Ryota Ozaki),
    Fix migration with QEMU 1.6 (Michael Avdienko),
    nodeinfo: fix build on non-Linux (Eric Blake)

Bug Fixes:
    vbox: handle errors of virDomainHostdevDefAlloc correctly (Ryota Ozaki),
    vbox: fix incorrect loop condition in vboxHostDeviceGetXMLDesc (Ryota Ozaki),
    Fix memory leak in virNWFilterDefParseXML() (Nehal J Wani),
    Fix memory leak in virDomainDefParseXML() (Nehal J Wani),
    LXC: Ensure security context is set when mounting images (Daniel P. Berrange),
    network: properly update iptables rules during net-update (Laine Stump),
    Fix bug in identifying sub-mounts (Daniel P. Berrange),
    storage: skip selinux cleanup when fd not available (Eric Blake),
    qemu: preserve netdev MAC address during 'domxml-to-native' (Bing Bu Cao),
    storage: don't read storage volumes in nonblock mode (Eric Blake),
    LXC: don't unmount mounts for shared root (Gao feng),
    LXC: fix the problem that libvirt lxc fail to start on latest kernel (Gao feng),
    sasl: Fix authentication when using PLAIN mechanism (Christophe Fergeau),
    Fix invalid read in virNetSASLSessionClientStep debug log (Christophe Fergeau),
    Tie SASL callbacks lifecycle to virNetSessionSASLContext (Christophe Fergeau),
    remote: Don't leak priv->tls object on connection failure (Christophe Fergeau),
    spec: Don't save/restore running VMs on libvirt-client update (Jiri Denemark),
    virsh domxml-from-native to treat SCSI as the bus type for pseries by default (Shivaprasad G Bhat),
    Don't start a nested job in qemuMigrationPrepareAny (JÃ¡n Tomko),
    spec: Don't save/restore running VMs on libvirt-client update (Cole Robinson),
    spec: Restrict virt-login-shell usage (Jiri Denemark),
    storage: use valid XML for awkward volume names (Eric Blake),
    storage: Returns earlier if source adapter of the scsi pool is a HBA (Osier Yang),
    libvirt-guests: Run only after libvirtd (Cole Robinson),
    Fix off-by-1 in default SELinux MCS range (Daniel P. Berrange),
    vbox: fix segfault on virsh dumpxml with the existence of USB filters (Ryota Ozaki),
    Add missing 'return 0;' in stub lxcStartFuse() method impl. (Daniel P. Berrange),
    Avoid async signal safety problem in glibc's setxid (Daniel P. Berrange),
    Don't release spice port twice when no TLS port is available (JÃ¡n Tomko),
    Properly unref a connection with a close callback (JÃ¡n Tomko),
    qemu: Call qemuSetupHostdevCGroup later during hotplug (Jiri Denemark),
    qemuMonitorIO: Don't use @mon after it's unrefed (Michal Privoznik),
    qemuProcessReconnectHelper: Don't create joinable thread (Michal Privoznik),
    virDomainEventCallbackListFree: Don't leak @list->callbacks (Michal Privoznik),
    networkBuildDhcpDaemonCommandLine: Don't leak @configstr and @configfile (Michal Privoznik),
    Disable nwfilter driver when running unprivileged (JÃ¡n Tomko),
    libxl: Fix Xen 4.4 libxlVmStart logic (Jason Andryuk),
    qemu: Check for presence of device and properities when getting CPUID (Peter Krempa),
    Fix busy wait loop in LXC container I/O handling (Daniel P. Berrange),
    Don't expose 'none' machine type to capabilities (Daniel P. Berrange),
    Fix mem leak in virQEMUCapsProbeQMPMachineTypes on OOM (Daniel P. Berrange),
    virSecurityLabelDefParseXML: Don't parse label on model='none' (Michal Privoznik),
    virsh-domain: Mark --live and --config mutually exclusive in vcpucount (Peter Krempa),
    qemu: Fix SCSI hotplug on pseries guests (Vitor de Lima),
    pci: properly handle out-of-order SRIOV virtual functions (Laine Stump),
    util: use -w flag when calling iptables (Serge Hallyn),
    storage: Fix a vol-clone bug on ppc64 (Li Zhang),
    qemu: Don't access vm->priv on unlocked domain (Michal Privoznik),
    qemu: Avoid double free of VM (Michal Privoznik),
    Allow root directory in filesystem source dir schema (JÃ¡n Tomko),
    qemuMigrationBeginPhase: Check for 'drive-mirror' for NBD (Michal Privoznik),
    conf: fix incorrect error log in virCPUDefIsEqual (Chen Hanxiao),
    qemuMonitorDispose: Reset lastError (Michal Privoznik),
    qemu: clean up migration ports when migration cancelled (Zeng Junliang),
    network: fix connections count in case of allocate failure (Laine Stump),
    virpcitest: Fix variable arguments using in pci_driver_new (Michal Privoznik),
    virpci: Don't error on unbinded devices (Michal Privoznik)

Improvements:
    Pull lxcContainerGetSubtree out into shared virfile module (Daniel P. Berrange),
    Introduce standard methods for sorting strings with qsort (Daniel P. Berrange),
    conf: Export virStorageVolType enum helper functions (Peter Krempa),
    sasl: Replace 'restep' label with 'continue' (Christophe Fergeau),
    storage: probe qcow2 volumes in gluster pool (Eric Blake),
    storage: improve handling of symlinks in gluster (Eric Blake),
    storage: improve allocation stats reported on gluster files (Eric Blake),
    storage: improve directory support in gluster pool (Eric Blake),
    storage: add network-dir as new storage volume type (Eric Blake),
    storage: implement rudimentary glusterfs pool refresh (Eric Blake),
    storage: initial support for linking with libgfapi (Eric Blake),
    storage: expose volume meta-type in XML (Eric Blake),
    storage: allow interleave in volume XML (Eric Blake),
    maint: next release is 1.2.0 (Eric Blake),
    vbox: import vbox_CAPI_v4_3.h from SDK (Ryota Ozaki),
    vbox: pull vboxHostDeviceGetXMLDesc out from vboxDomainGetXMLDesc (Ryota Ozaki),
    vbox: cleanup vboxAttachUSB (Ryota Ozaki),
    lxc: don't do duplicate work when getting pagesize (Chen Hanxiao),
    maint: update to latest gnulib (Eric Blake),
    python: remove virConnectGetCPUModelNames from globals (Doug Goldstein),
    python: remove virConnectGetCPUModelNames from globals (Doug Goldstein),
    qemu: Auto-generate controller for hotplugged hostdev (Eric Farman),
    qemu: Separate calls based on controller bus type (Eric Farman),
    qemu: Rename controller hotplug functions to not be PCI-specific (Eric Farman),
    qemu: Add support for virt machine type with virtio-mmio devices on armv7 (Clark Laughlin),
    maint: enforce comma style usage (Eric Blake),
    maint: fix comma style issues: remaining code (Eric Blake),
    maint: fix comma style issues: remaining drivers (Eric Blake),
    maint: fix comma style issues: vbox (Eric Blake),
    maint: fix comma style issues: python (Eric Blake),
    maint: fix comma style issues: util (Eric Blake),
    maint: fix comma style issues: tests, tools (Eric Blake),
    maint: fix comma style issues: qemu (Eric Blake),
    maint: fix comma style issues: xen (Eric Blake),
    maint: fix comma style issues: conf (Eric Blake),
    maint: fix comma style issues: nwfilter (Eric Blake),
    Error out on unterminated arrays and objects in JSON parser (JÃ¡n Tomko),
    Test if JSON parser fails on invalid input (JÃ¡n Tomko),
    maint: ship .pl scripts as executables (Eric Blake),
    Fix virsh net-info output for consistency (Hao Liu),
    Add missing break to switch-case block (Doug Goldstein),
    qemumonitorjsontest: Introduce GetNonExistingCPUData test (Michal Privoznik),
    Macro for testing the version you are compiling with (Doug Goldstein),
    Return -1 in virPortAllocatorAcquire if all ports are used (JÃ¡n Tomko),
    Add a name to virPortAllocator (JÃ¡n Tomko),
    storage: fix RNG validation of gluster via netfs (Eric Blake),
    virsh-secret: Unify list column alignment (Peter Krempa),
    virsh-interface: Unify list column alignment (Peter Krempa),
    virsh-nwfilter: Unify list command column alignment (Peter Krempa),
    virsh-pool: Unify spacing of listing function (Peter Krempa),
    qemu: Change return type of qemuMonitorGetGuestCPU() (Peter Krempa),
    virsh-volume: Unify strigification of volume type (Peter Krempa),
    virsh-volume: Unify alignment of vol-list output columns (Peter Krempa),
    conf: Refactor virDomainDiskSourceDefParse (Peter Krempa),
    conf: Rename virDomainDiskHostDefFree to virDomainDiskHostDefClear (Peter Krempa),
    conf: Split out code to parse the source of a disk definition (Peter Krempa),
    qemuDomainObjStart: Warn on corrupted image (Michal Privoznik),
    util: use size_t instead of unsigned int for num_virtual_functions (Laine Stump),
    qemu: assign PCI address to primary video card (Vitor de Lima),
    qemu: process: Validate specific CPUID flags of a guest (Peter Krempa),
    qemu: Add support for paravirtual spinlocks in the guest (Peter Krempa),
    conf: Refactor storing and usage of feature flags (Peter Krempa),
    cpu: x86: Add internal CPUID features support and KVM feature bits (Peter Krempa),
    qemu: Add monitor APIs to fetch CPUID data from QEMU (Jiri Denemark),
    cpu_x86: Refactor storage of CPUID data to add support for KVM features (Peter Krempa),
    tests: Distribute virpcitestdata (Michal Privoznik),
    tests: Fix virtpcitest in VPATH (Jiri Denemark),
    conf: Refactor virDomainDiskSourcePoolDefParse (Peter Krempa),
    storage: always probe type with buffer (Eric Blake),
    storage: refactor backing chain division of labor (Eric Blake),
    storage: reduce number of stat calls (Eric Blake),
    storage: avoid short reads while chasing backing chain (Eric Blake),
    storage: use simpler 'char *' (Eric Blake),
    test driver: add support for .connectBaselineCPU (Giuseppe Scrivano),
    virpcitest: Introduce testVirPCIDeviceReset (Michal Privoznik),
    virt-login-shell: also build virAtomic.h (Guido GÃ¼nther),
    storage: recognize gluster as networked file (Eric Blake),
    qemu: don't use deprecated -no-kvm-pit-reinjection (JÃ¡n Tomko),
    Resolve Coverity issue regarding not checking return value (John Ferlan),
    Skip any files which are not mounted on the host (Daniel P. Berrange),
    Add flag to lxcBasicMounts to control use in user namespaces (Daniel P. Berrange),
    Remove duplicate entries in lxcBasicMounts array (Daniel P. Berrange),
    Remove pointless 'srcpath' variable in lxcContainerMountBasicFS (Daniel P. Berrange),
    Remove unused 'opts' field from LXC basic mounts struct (Daniel P. Berrange),
    Add virFileIsMountPoint function (Daniel P. Berrange),
    virpcitest: Introduce check for unbinded devices (Michal Privoznik),
    virpcitest: Introduce testVirPCIDeviceReattach (Michal Privoznik),
    virpcitest: Test virPCIDeviceDetach (Michal Privoznik),
    tests: Introduce virpcitest (Michal Privoznik),
    cpu: x86: Parse the CPU feature map only once (Peter Krempa),
    cpu: Export few x86-specific APIs (Jiri Denemark),
    nodeinfo: Remove libnuma include (Peter Krempa),
    numa: Add wrapper of numa_node_to_cpus and use it (Peter Krempa),
    numa: Replace NUMA_MAX_N_CPUS macro with virNumaGetMaxCPUs() (Peter Krempa),
    nodeinfo: Get rid of nodeGetCellMemory (Peter Krempa),
    numa: Introduce virNumaGetNodeMemory and use it instead of numa_node_size64 (Peter Krempa),
    numa: Introduce virNumaGetMaxNode and use it instead of numa_max_node (Peter Krempa),
    nodeinfo: Avoid forward declarations of static functions (Peter Krempa),
    numa: Introduce virNumaIsAvailable and use it instead of numa_available (Peter Krempa)

Cleanups:
    Remove obsolete 'tests' makefile target (Daniel P. Berrange),
    Mostly revert "python: remove virConnectGetCPUModelNames from globals" (Daniel P. Berrange),
    Remove redundant braces (JÃ¡n Tomko),
    virPCIDeviceBindToStub: Remove unused @oldDriverPath and @oldDriverName (Michal Privoznik)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |   2 -
 .../0001-Add-virFileIsMountPoint-function.patch    | 135 -------------------
 ...2-Remove-unused-opts-field-from-LXC-basic.patch |  97 --------------
 ...path-variable-in-lxcContainerMountBasicFS.patch |  78 -----------
 ...duplicate-entries-in-lxcBasicMounts-array.patch | 117 ----------------
 ...cMounts-to-control-use-in-user-namespaces.patch |  83 ------------
 ...y-files-which-are-not-mounted-on-the-host.patch | 106 ---------------
 ...ount-securityfs-when-user-namespace-enabl.patch |  52 --------
 ...ry-to-mount-selinux-filesystem-when-user-.patch |  48 -------
 ...of-mounts-out-of-lxcContainerMountBasicFS.patch | 147 ---------------------
 ...ow-location-of-python-on-the-target-to-be.patch |  53 --------
 .../libvirt/{libvirt_1.1.2.bb => libvirt_1.2.0.bb} |  13 +-
 12 files changed, 2 insertions(+), 929 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-allow-location-of-python-on-the-target-to-be.patch
 rename recipes-extended/libvirt/{libvirt_1.1.2.bb => libvirt_1.2.0.bb} (89%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 1bf6323..0d3278d 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -15,5 +15,3 @@ FILES_${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
 FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
 EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python"
-
-SRC_URI += "file://libvirt-allow-location-of-python-on-the-target-to-be.patch"
\ No newline at end of file
diff --git a/recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch b/recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch
deleted file mode 100644
index 0affcbe..0000000
diff --git a/recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch b/recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch
deleted file mode 100644
index 2a3d3ef..0000000
diff --git a/recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch b/recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch
deleted file mode 100644
index 5135fb0..0000000
diff --git a/recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch b/recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch
deleted file mode 100644
index c02295e..0000000
diff --git a/recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch b/recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch
deleted file mode 100644
index c9e0afc..0000000
diff --git a/recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch b/recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch
deleted file mode 100644
index a0ac414..0000000
diff --git a/recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch b/recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch
deleted file mode 100644
index 40f8dd9..0000000
diff --git a/recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch b/recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch
deleted file mode 100644
index f058293..0000000
diff --git a/recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch b/recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch
deleted file mode 100644
index 2c7b0ee..0000000
diff --git a/recipes-extended/libvirt/libvirt/libvirt-allow-location-of-python-on-the-target-to-be.patch b/recipes-extended/libvirt/libvirt/libvirt-allow-location-of-python-on-the-target-to-be.patch
deleted file mode 100644
index 6fff8ea..0000000
diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.2.0.bb
similarity index 89%
rename from recipes-extended/libvirt/libvirt_1.1.2.bb
rename to recipes-extended/libvirt/libvirt_1.2.0.bb
index 598d7ef..80f06a2 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.0.bb
@@ -21,20 +21,11 @@ RCONFLICTS_${PN}_libvirtd = "connman"
 
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
-           file://LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch \
-           file://Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch \
-           file://LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch \
-	   file://0001-Add-virFileIsMountPoint-function.patch \
-	   file://0002-Remove-unused-opts-field-from-LXC-basic.patch \
-	   file://0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch \
-	   file://0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch \
-	   file://0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch \
-	   file://0006-Skip-any-files-which-are-not-mounted-on-the-host.patch \
 	   file://libvirtd.sh \
 	   file://libvirtd.conf"
 
-SRC_URI[md5sum] = "1835bbfa492099bce12e2934870e5611"
-SRC_URI[sha256sum] = "16648af54d3e162f5cc5445d970ec29a0bd55b1dbcb568a05533c4c2f25965e3"
+SRC_URI[md5sum] = "f74f78059def4e68d69b975ad6e6c3e2"
+SRC_URI[sha256sum] = "a8e578ae7861db2ac5f454073293d2ef3229fd3f6c4f9029101763244db22ddd"
 
 inherit autotools gettext update-rc.d
 
-- 
1.8.1.2


