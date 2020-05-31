import re

deb_path = "docker-ce/components/packaging/deb/common/control"
deb_ver = "containerd (>= 1.2.1)"

rpm_path = "docker-ce/components/packaging/rpm/SPECS/docker-ce.spec"
rpm_ver = "Requires: containerd >= 1.2.1"

# Update debian containerd dependency
deb = open(deb_path, 'r')
data = deb.read()
data = re.sub(r'containerd.io \([^)]*\)', deb_ver, data)
open(deb_path, 'w').write(data)

# Update rpm containerd dependency
rpm = open(rpm_path, 'r')
data = rpm.read()
data = re.sub(r'Requires: containerd.io [^\n]*', rpm_ver, data)
open(rpm_path, 'w').write(data)
print(data)