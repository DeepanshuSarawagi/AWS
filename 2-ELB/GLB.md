# Gateway Load Balancer

- Operates at layer 3, network layer using IP protocol.
- Deploy, scale and manage a fleet of 3rd party network virtual appliances in AWS.
- Example: Firewalls, packet inspection, intrusion detection and prevention systems
  payload manipulation then GWLB is best suited for this type.
- Has the following functions:
  - Transparent network gateway: Single entry/exit point for all the user traffic.
  - Load Balancer: Distributes traffic to your virtual appliances
  - Uses the GENEVE protocol on port 6081.
